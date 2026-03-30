# Current Context

## Current Focus

[2026-03-30] OpenCode integration complete. MCP bridge functional with patcher targeting (list_patchers, target_patcher). Ready for commit and push.

## Immediate Goals

1. Commit feature/opencode-integration branch with all changes
2. Test remaining MCP tools through targeted patchers
3. Consider contributing list_patchers/target_patcher upstream

## Blockers

None currently.

## Recent Activity

- [2026-03-30] Created feature/opencode-integration branch
- [2026-03-30] Set up workspace/memory/ 4-layer structure
- [2026-03-30] Created .opencode/opencode.json with MCP server config
- [2026-03-30] Symlinked docs.json into knowledge base
- [2026-03-30] Created .opencode/AGENTS.md adapted from CLAUDE.md
- [2026-03-30] Set up Python 3.12 venv (3.14 failed: pydantic-core incompatible)
- [2026-03-30] Symlinked opencode.json from DEVIALET_Max project for cross-project MCP access
- [2026-03-30] Tested MCP connectivity: all basic tools functional
- [2026-03-30] Added parentpatcher auto-detection to max_mcp.js and max_mcp_v8_add_on.js
- [2026-03-30] Created bridge_demo.maxpat with p mcp_bridge subpatcher
- [2026-03-30] Implemented list_patchers and target_patcher (server.py, max_mcp.js, max_mcp_v8_add_on.js)
- [2026-03-30] Discovered max.frontpatcher returns null inside subpatchers in both engines
- [2026-03-30] Fixed with get_top_patcher() / js_get_top_patcher() -- walk parentpatcher chain
- [2026-03-30] Verified: list_patchers returns all 7 open windows, target_patcher switches correctly
- [2026-03-30] Documented patterns (patcher-targeting, bridge-subpatcher) and techniques (wind-traversal)
