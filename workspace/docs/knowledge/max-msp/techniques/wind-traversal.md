# Technique: Wind Object Traversal

## Description

Enumerate all visible patcher windows in Max using the `Wind` linked list. This is the only way to discover and access arbitrary open patchers from JavaScript.

## Max JS API

The `Wind` object represents a visible patcher window. Key properties:

| Property | Type | Description |
|----------|------|-------------|
| `wind.next` | Wind or null | Next window in the linked list |
| `wind.assoc` | Patcher | The patcher associated with this window |

Access the first `Wind` object from any `Patcher` reference:

```javascript
var w = somePatcher.wind;  // Wind object for this patcher's window
```

The `Patcher` object properties used during traversal:

| Property | Type | Description |
|----------|------|-------------|
| `patcher.name` | string | Window title (filename without extension) |
| `patcher.filepath` | string | Full file path (Macintosh HD format), empty if unsaved |
| `patcher.count` | int | Number of objects in the patcher |
| `patcher.wind` | Wind | This patcher's window reference |
| `patcher.parentpatcher` | Patcher or undefined | Parent patcher (undefined at top level) |

## Usage Pattern

```javascript
function enumerate_patchers(starting_patcher) {
    var results = [];
    var w = starting_patcher.wind;
    while (w) {
        var p = w.assoc;
        if (p) {
            results.push({
                name: p.name || "(untitled)",
                filepath: p.filepath || "",
                count: p.count || 0
            });
        }
        w = w.next;
    }
    return results;
}
```

## Getting a Starting Patcher

Three methods, in order of preference:

1. **`max.frontpatcher`** -- Returns the frontmost patcher. Returns `null` when the js/v8 object runs inside a subpatcher.

2. **`get_top_patcher()`** -- Walk up `this.patcher.parentpatcher` chain to find the top-level patcher. Reliable from any nesting depth.

3. **`this.patcher`** -- The patcher containing the js/v8 object. If inside a subpatcher, its `.wind` may still provide traversal access.

Recommended pattern:

```javascript
function get_wind_start() {
    var front = max.frontpatcher;
    if (front && front.wind) return front;
    
    // Fallback: walk up to top level
    var p = this.patcher;
    while (p.parentpatcher) {
        p = p.parentpatcher;
    }
    if (p && p.wind) return p;
    
    return null;
}
```

## Limitations

- Only visible (open) patcher windows appear in the Wind chain
- Closed patchers, hidden windows, and minimized windows may not be traversable
- The Wind chain order is not guaranteed (may reflect z-order or creation order)
- `parentpatcher` returns `undefined` (not `null`) at the top level

## Sources

- [C74 Ref: reference/jspatcherobject] Patcher and Wind JS API (authoritative)
- [C74 Ref: reference/jsmax] max.frontpatcher (authoritative)

## Date Added

2026-03-30
