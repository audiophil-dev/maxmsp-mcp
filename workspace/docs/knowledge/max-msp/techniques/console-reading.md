# Technique: Console Reading via MCP Bridge

## Summary

The MCP bridge captures Max console output via a `[console]` object, stores it in a 10,000-entry JS ring buffer, and exposes it through three MCP tools. This enables automated test result collection and debugging from the AI agent.

## Architecture

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

## Usage Tips

- `[tosymbol]` is critical: converts multi-word console text into a single symbol so `[pack]` preserves the full message
- Without `[tosymbol]`, `[pack s s 0]` truncates at the first space
- The `[console]` object must be named (`mcp_console`) for clear_max_console to find it
- Ring buffer persists across clear_max_console calls (only visual console is cleared)

## MCP Tools

| Tool | Purpose | Clears Buffer | Clears Visual |
|------|---------|---------------|---------------|
| `get_max_console(lines)` | Read last N entries | No | No |
| `clear_max_console()` | Clear visual console | No | Yes |
| `clear_console_buffer()` | Clear ring buffer | Yes | No |

## Gotchas

- Console output from the bridge's own `max_mcp.js` post() calls may not be captured (self-referential)
- Console output from v8ui objects in OTHER patchers is NOT captured unless those patchers also output to this console
- The `bang` message through `[tosymbol]` produces stale text (tosymbol treats bang as "output stored value")

## Sources

- Ported from upstream PR #1 (BenCello, commit cec27cc) with modifications
- Implemented in maxmsp-mcp feature/console-reading branch (2026-03-30)

## Date Added

2026-03-30
