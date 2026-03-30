# Progress

## Completed

- [2026-03-30] OpenCode integration setup: .opencode/opencode.json, workspace structure, memory bank
- [2026-03-30] .opencode/AGENTS.md created from CLAUDE.md with Max/MSP MCP rules
- [2026-03-30] Python 3.12 venv created (3.14 incompatible with pydantic-core)
- [2026-03-30] opencode.json symlinked into DEVIALET_Max for cross-project access
- [2026-03-30] MCP connectivity verified: basic tools work (add/remove/connect objects, query, safety check)
- [2026-03-30] parentpatcher auto-detection added to max_mcp.js and max_mcp_v8_add_on.js
- [2026-03-30] bridge_demo.maxpat created with p mcp_bridge subpatcher encapsulation
- [2026-03-30] list_patchers tool: enumerate all open patcher windows (name, filepath, count, is_front)
- [2026-03-30] target_patcher tool: switch bridge target to any open patcher by name
- [2026-03-30] get_top_patcher() fix: reliable Wind traversal when max.frontpatcher is null
- [2026-03-30] Both js and v8 engines retarget correctly (verified with get_avoid_rect_position and object creation)
- [2026-03-30] Knowledge base documented: patcher-targeting pattern, bridge-subpatcher pattern, wind-traversal technique

## In Progress

- Commit and push feature/opencode-integration branch

## Next

- Test all 28 MCP tools through targeted patchers
- Consider contributing list_patchers/target_patcher and parentpatcher fix upstream to ersatzben/maxmsp-mcp
- Test bridge_demo.maxpat as standalone bridge (without demo.maxpat)
- Document remaining MCP tool behaviors specific to OpenCode
