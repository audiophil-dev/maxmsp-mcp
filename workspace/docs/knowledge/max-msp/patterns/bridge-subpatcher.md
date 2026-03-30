# Pattern: Bridge as Subpatcher

## Category

utilities / MCP infrastructure

## Description

The MCP bridge wiring (`node.script`, `js`, `v8`) lives inside a `p mcp_bridge` subpatcher. The `parentpatcher` auto-detection ensures that MCP operations target the parent patcher (the workspace), not the bridge's internal subpatcher.

## Problem

The original demo (`demo.maxpat`) places the bridge wiring at the root of a patcher. MCP creates objects in the same patcher as the bridge wiring, causing clutter and overlap. Users want a clean workspace where the bridge is encapsulated.

## Solution

### parentpatcher Auto-Detection

Both `max_mcp.js` and `max_mcp_v8_add_on.js` check `this.patcher.parentpatcher` at initialization:

```javascript
// max_mcp.js (line 10)
var root_patcher = this.patcher.parentpatcher ? this.patcher.parentpatcher : this.patcher;

// max_mcp_v8_add_on.js (line 7-8)
var target_patcher = this.patcher.parentpatcher ? this.patcher.parentpatcher : this.patcher;
```

When the js/v8 objects are inside `p mcp_bridge`, `this.patcher` is the subpatcher and `this.patcher.parentpatcher` is the containing workspace patcher. When at top level (as in the original demo), `parentpatcher` is undefined, so the fallback to `this.patcher` preserves backward compatibility.

### Bridge Wiring (inside p mcp_bridge)

```
inlet (from parent: start/stop messages)
  |
[node.script max_mcp_node.js]  <-- Socket.IO server on port 5002
  |                     ^
  outlet 0              | inlet (responses back to Socket.IO)
  |                     |
[route command]         |
  |                     |
[js max_mcp.js]  -----> + (outlet 1: responses)
  |                     |
  outlet 2              |
  |                     |
[v8 max_mcp_v8_add_on.js] ---> + (outlet 1: responses)
```

### bridge_demo.maxpat Structure

```
bridge_demo.maxpat (parent -- workspace)
  |
  [p mcp_bridge 5002]  -- bridge wiring inside
  |
  [start] [stop]       -- message boxes to control bridge
  |
  --- Workspace ---     -- AI-created objects appear here
```

## Limitations

- `parentpatcher` goes up exactly one level. If the bridge subpatcher is nested deeper, targeting goes to the immediate parent, not the root.
- The bridge must be inside a visible patcher for Wind traversal to find other open patchers.

## Gotchas

- After moving bridge wiring into a subpatcher, `max.frontpatcher` returns null from within the subpatcher. Use `get_top_patcher()` instead (see patcher-targeting pattern).
- The port argument (`5002`) can be passed as an argument to the `p` object. Inside the subpatcher, use `#1` to reference it and send as a message to `node.script`.

## Sources

- [Project: MaxMSP_Agent/bridge_demo.maxpat] Reference implementation
- [C74 Ref: reference/jspatcherobject] Patcher.parentpatcher property (authoritative)

## Date Added

2026-03-30
