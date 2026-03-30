# maxmsp-mcp -- OpenCode Agent Instructions

## Project Overview

MCP server and client enabling AI agents to programmatically create, modify, query, and test Max/MSP patches through 28 MCP tools.

## Critical Rules

Before creating or modifying any Max/MSP patch, load the maxmsp skills:
- `skill(name="maxmsp-research")` -- Research methodology
- `skill(name="maxmsp-design-patterns")` -- Architecture patterns and gotcha flags
- `skill(name="maxmsp-object-reference")` -- Object lookup via docs.json
- `skill(name="maxmsp-signal-flow")` -- Signal routing principles

## Mandatory Checklist (Before Every Patch Operation)

### Before placing any object

1. Consider whether a subpatcher is more appropriate
2. Call `get_avoid_rect_position()` to find a clear area
3. Use returned `[left, top, right, bottom]` to calculate position
4. Place at `y = bottom + 50` minimum

Never skip this step. Never guess positions.

### Required acknowledgment flags

These flags must be set explicitly in MCP tool calls when applicable:

| Flag | When Required | Details |
|------|--------------|---------|
| `int_mode=True` | Math objects if integer truncation is intentional | JSON strips `.0` from numbers. Use STRING args: `["0", "127", "0", "25."]` |
| `use_live_dial=True` | Using `live.dial` instead of `dial` | Default: use `dial` with `@size` attribute |
| `trigger_rtl=True` | Using `trigger` or `t` objects | Fires right-to-left: `[t b f]` sends `f` first, then `b` |
| `not_line_msg=True` | Sending odd-count values to `line~` | `line~` requires even count (value-time pairs) |

### coll objects

Always include `@embed 1` in args: `['mycoll', '@embed', 1]`. Data does not persist without this.

### Message boxes

Use numbers `[200, 0, 50]`, not strings `["200", "0", "50"]` (strings create literal quotes in Max).

## Signal Flow Rules

- **Auto-summing**: MSP inlets automatically sum all incoming signals. Do not use `+~` just to combine signals -- connect them to the same inlet.
- **Delay feedback**: Connect feedback directly to `tapin~`, never through a mixer first.
- **Domain crossing**: Use `sig~` (control to signal) and `snapshot~` (signal to control) for explicit conversion.

## Placement Rules

After `get_avoid_rect_position()` returns `[left, top, right, bottom]`:
- First object: `[left, bottom + 50]`
- Same row: `x += previous_width + 25`
- New row: `x = left`, `y += 50`

## Subpatcher Workflow

```
create_subpatcher([x, y], "varname", "display_name")
enter_subpatcher("varname")
  add inlet/outlet objects
  build internal logic
exit_subpatcher()
connect from parent
```

Use subpatchers for: effects, voices, drums, sequencers, mixers, modulation.

## MCP Tools Reference

| Tool | Purpose |
|------|---------|
| `get_avoid_rect_position()` | Get bounding box before placing (required) |
| `add_max_object(pos, type, var, args)` | Create object (auto-fits width) |
| `remove_max_object(var)` | Delete object |
| `connect(src_var, outlet, dst_var, inlet)` | Connect objects |
| `disconnect(src_var, outlet, dst_var, inlet)` | Disconnect objects |
| `move_object(var, x, y)` | Reposition object |
| `recreate_with_args(var, args)` | Change creation-time args, preserving connections |
| `autofit_existing(var)` | Apply auto-fit to existing object |
| `set_object_attribute(var, attr, val)` | Set attribute on object |
| `set_message_text(var, text)` | Set message box content |
| `set_number(var, value)` | Set number box value |
| `send_bang(var)` | Send bang to object |
| `send_messages(var, messages)` | Send arbitrary messages |
| `get_objects_in_patch()` | List all objects in current patcher |
| `get_objects_in_selected()` | List selected objects |
| `get_object_attributes(var)` | Get all attributes of object |
| `get_object_connections(var)` | Get all connections |
| `get_avoid_rect_position()` | Get clear placement area |
| `list_all_objects()` | List all Max object types |
| `get_object_doc(name)` | Get object documentation |
| `create_subpatcher(pos, var, name)` | Create p object |
| `enter_subpatcher(var)` | Navigate into subpatcher |
| `exit_subpatcher()` | Navigate out of subpatcher |
| `get_patcher_context()` | Get current patcher info |
| `add_subpatcher_io(type, index)` | Add inlet/outlet to subpatcher |
| `check_signal_safety()` | Verify signal amplitude safety |
| `encapsulate()` | Encapsulate selected objects |
| `list_patchers()` | List all open patcher windows with names, filepaths, object counts |
| `target_patcher(name, filepath?)` | Switch bridge target to a different open patcher |

## Architecture

```
Agent (OpenCode) <-- MCP --> server.py (FastMCP/Python)
                                |
                           Socket.IO (port 5002)
                                |
                           max_mcp_node.js (Node bridge)
                                |
                           max_mcp.js + max_mcp_v8_add_on.js
                                |
                             Max/MSP
```

## After Code Changes

Reload JS objects in Max (double-click to open editor, then close) and restart node.script (`script stop`, `script start`).

## Patcher Targeting

The MCP bridge targets one patcher at a time. By default, it targets the parent of the subpatcher containing the bridge wiring.

### Multi-patcher workflow

1. Call `list_patchers()` to see all open patcher windows
2. Call `target_patcher("PatcherName")` to switch target
3. All subsequent operations (`add_max_object`, `get_objects_in_patch`, etc.) operate on the targeted patcher
4. Use `target_patcher("front")` to target the frontmost window
5. Use optional `filepath` parameter to disambiguate when multiple patchers share a name

### Single bridge instance

Only one bridge is needed. Open `bridge_demo.maxpat` (or any patcher with `p mcp_bridge`) and click `start`. All OpenCode projects with the `opencode.json` symlink connect to the same bridge. Use `target_patcher` to switch between any open patchers.

### Bridge placement

The bridge lives inside a `p mcp_bridge` subpatcher. The `parentpatcher` auto-detection ensures MCP operations target the workspace patcher, not the bridge internals. See `workspace/docs/knowledge/max-msp/patterns/bridge-subpatcher.md`.

## Memory Bank

Check `workspace/memory/` for project context, decisions, and progress before starting work.

## Knowledge Base

- `workspace/docs/knowledge/max-msp/objects/docs.json` -- 1,129 object specifications (symlinked from project root)
- `workspace/docs/knowledge/max-msp/patterns/` -- Reusable patch patterns
- `workspace/docs/knowledge/max-msp/techniques/` -- Cross-cutting techniques
