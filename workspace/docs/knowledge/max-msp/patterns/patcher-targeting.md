# Pattern: Patcher Targeting

## Category

utilities / MCP infrastructure

## Description

Mechanism for switching the MCP bridge target between open patcher windows. By default, the bridge targets the patcher containing (or parenting) the js/v8 objects. The `list_patchers` and `target_patcher` tools allow dynamic retargeting to any open patcher window.

## Problem

The MCP bridge (`max_mcp.js`, `max_mcp_v8_add_on.js`) initializes `root_patcher` / `current_patcher` from `this.patcher.parentpatcher` (or `this.patcher` when at top level). All object creation, connection, and query operations use these references. When multiple patchers are open, the bridge operates on only one of them unless explicitly retargeted.

## Solution: Wind Traversal

Max's `Wind` object provides a linked list of all visible patcher windows. The traversal pattern:

```javascript
// Start from any known patcher's .wind property
var w = somePatcher.wind;
while (w) {
    var p = w.assoc;   // Patcher associated with this window
    // p.name = window title
    // p.filepath = file path on disk (empty if unsaved)
    // p.count = number of objects
    w = w.next;        // next window in chain
}
```

## Critical Discovery: max.frontpatcher is null inside subpatchers

`max.frontpatcher` returns `null` in both the legacy `js` engine and the `v8` engine when the JavaScript code runs inside a subpatcher (e.g., `p mcp_bridge`). This was the initial cause of `list_patchers` and `target_patcher` returning empty results.

### Fix: get_top_patcher()

Walk up the `parentpatcher` chain to find the top-level patcher, then use its `.wind` property:

```javascript
// v8 engine version
function get_top_patcher() {
    var p = this.patcher;
    while (p.parentpatcher) {
        p = p.parentpatcher;
    }
    return p;
}

// Legacy js engine version (identical logic)
function js_get_top_patcher() {
    var tp = this.patcher;
    while (tp.parentpatcher) {
        tp = tp.parentpatcher;
    }
    return tp;
}
```

Both js and v8 engines must implement this independently because they are separate execution contexts. The fix attempts `max.frontpatcher` first, then falls back to `get_top_patcher()`.

## MCP Tools

### list_patchers

Returns all open patcher windows with:
- `name`: window title
- `filepath`: file path on disk (Macintosh HD format, empty if unsaved)
- `object_count`: number of objects in the patcher
- `is_front`: whether this is the frontmost window
- `current_target`: name of the currently targeted patcher

### target_patcher

Switches the bridge target to a named patcher. Accepts:
- `name`: patcher window title (or `"front"` for frontmost)
- `filepath` (optional): disambiguate when multiple patchers share a name

Updates `root_patcher`, `current_patcher`, `p` in js engine and `target_patcher` in v8 engine. Resets `patcher_stack` and `avoid_rect_called`.

## Dual-Engine Synchronization

Both `max_mcp.js` (legacy js) and `max_mcp_v8_add_on.js` (v8) must agree on the target patcher. The dispatch flow:

1. MCP tool call arrives at `max_mcp.js`
2. js engine updates its own `root_patcher` / `current_patcher` / `p` via Wind traversal
3. js engine delegates to v8 via `outlet(2, ...)` for the response
4. v8 engine updates its own `target_patcher` via Wind traversal
5. v8 sends the response back to `node.script` via `outlet(1, ...)`

Both engines perform independent Wind traversal. If either fails, the other still handles its own operations correctly.

## Gotchas

- `max.frontpatcher` is unreliable inside subpatchers -- always fall back to `get_top_patcher()`
- Wind.next may only traverse visible (open) patcher windows -- closed or hidden patchers are not listed
- Unsaved patchers have empty `filepath`
- Patcher `name` is the window title, which can change if the user renames the file
- After targeting, `avoid_rect_called` resets to false -- call `get_avoid_rect_position()` before placing objects
- Subpatcher navigation (`enter_subpatcher`/`exit_subpatcher`) operates within the targeted patcher

## Sources

- [C74 Ref: reference/jspatcherobject] Wind and Patcher JS API (authoritative)
- [Project: max_mcp.js lines 1464-1528] js engine implementation
- [Project: max_mcp_v8_add_on.js lines 519-640] v8 engine implementation
- [Project: server.py] MCP tool definitions

## Date Added

2026-03-30
