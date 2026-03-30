# Architectural Patterns

## MCP Communication Pattern

All Max/MSP interaction follows: Agent -> MCP tool call -> server.py -> Socket.IO -> max_mcp_node.js -> max_mcp.js -> Max patcher API.

Responses flow back the same path in reverse. All operations are async with timeout handling.

## Two-Server Architecture

There are two servers, not one:

1. **MCP server** (server.py, Python) -- Started automatically by OpenCode. Speaks MCP to the agent and Socket.IO to Max. One per OpenCode session.
2. **Socket.IO bridge** (max_mcp_node.js, Node.js) -- Runs inside Max via `node.script` on port 5002. Must be started manually: open `MaxMSP_Agent/bridge_demo.maxpat`, click `start`. Only one instance needed globally; any project with the opencode.json config connects to it.

The MCP server is a Socket.IO client. The Max-side bridge is the Socket.IO server. If Max is not running or the bridge is not started, the MCP server fails to connect.

**Startup order**: The Max-side Socket.IO bridge can be started before or after OpenCode launches. If OpenCode starts the MCP server first and Max is not yet running, the MCP server will report "Connection closed." Restarting OpenCode (or reloading MCP servers) after starting the Max bridge resolves this.

## Single Bridge, Multiple Projects

Only one Socket.IO bridge instance is needed in Max. MCP tools operate on whichever patcher is currently targeted. Any OpenCode project with the opencode.json symlink gets MCP access to the same running Max instance. Use `target_patcher` to switch between open patchers.

## Patcher Targeting Pattern

The bridge targets one patcher at a time. Use `list_patchers` to enumerate all open patcher windows, then `target_patcher("name")` to switch. Both `max_mcp.js` and `max_mcp_v8_add_on.js` must agree on the target.

### max.frontpatcher is null inside subpatchers

When js/v8 code runs inside a subpatcher (`p mcp_bridge`), `max.frontpatcher` returns null in both engines. The fix is `get_top_patcher()` which walks `this.patcher.parentpatcher` up to the top-level patcher, then uses its `.wind` property for Wind traversal.

See: `workspace/docs/knowledge/max-msp/patterns/patcher-targeting.md`

## Bridge as Subpatcher Pattern

The MCP bridge wiring lives inside `p mcp_bridge`. The `parentpatcher` auto-detection on initialization (`this.patcher.parentpatcher ? this.patcher.parentpatcher : this.patcher`) ensures operations target the workspace patcher, not the bridge's internal subpatcher. Backward compatible: when at top level, `parentpatcher` is undefined, fallback to `this.patcher`.

See: `workspace/docs/knowledge/max-msp/patterns/bridge-subpatcher.md`

## Object Placement Pattern

Before placing any object, call `get_avoid_rect_position` to find a clear area. Do not hardcode coordinates. This prevents object overlap in the patcher.

## Critical Flags (from CLAUDE.md)

1. **Math/float flag**: Any math operation on control values requires explicit float conversion (multiply by 1.0 or use float arguments)
2. **Dial flag**: `live.dial` uses 0-127 by default; set parameter range explicitly
3. **trigger_rtl flag**: Max processes outlets right-to-left; use `trigger` objects for explicit ordering
4. **coll embed flag**: `coll` data not saved by default; set `@embed 1`

## Message Box Convention

Message boxes must contain numbers, not strings. Example: `0.5` not `"0.5"`.

## Signal Safety Pattern

Use `check_signal_safety` tool after connecting signal objects to verify no dangerous amplitude levels.

## Subpatcher Pattern

Plan interface (inlets/outlets) before building internals. Use `create_subpatcher` then `enter_subpatcher` to build inside.

## Console Reading Pattern

The bridge captures Max console output via a `[console]` object (named `mcp_console`) inside the bridge subpatcher. Wiring:

```
[console mcp_console]
   |0 (source)     |1 (text)          |2 (type)
   |                v                  |
   |           [tosymbol]              |
   |                |                  |
   v                v                  v
   [pack s s 0] -------- inlet 0, 1, 2
        |
        v
   [js max_mcp.js] inlet 1
```

`[tosymbol]` converts multi-word message text into a single symbol so `[pack]` preserves the full text. Without it, `[pack s s 0]` truncates at the first word.

In JS, inlet 1 handler receives: `messagename` = source name, `arguments[0]` = full text (symbol), `arguments[1]` = type (int). Entries stored in a 10,000-entry ring buffer.

Three MCP tools:
- `get_max_console(lines)` -- read last N entries from ring buffer
- `clear_max_console()` -- clear visual console only (buffer preserved)
- `clear_console_buffer()` -- clear ring buffer only (visual console unchanged)
