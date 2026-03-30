# Progress

## Completed

- [2026-03-30] OpenCode integration setup: .opencode/opencode.json, workspace structure, memory bank
- [2026-03-30] .opencode/AGENTS.md created from CLAUDE.md with Max/MSP MCP rules
- [2026-03-30] Python 3.12 venv created (3.14 incompatible with pydantic-core)
- [2026-03-30] opencode.json symlinked into DEVIALET_Max for cross-project access
- [2026-03-30] MCP connectivity verified: basic tools work (add/remove/connect objects, query, safety check)
- [2026-03-30] parentpatcher auto-detection added to max_mcp.js and max_mcp_v8_add_on.js
- [2026-03-30] bridge_demo.maxpat created with p mcp_bridge subpatcher encapsulation
- [2026-03-30] list_patchers tool: enumerate all open patcher windows
- [2026-03-30] target_patcher tool: switch bridge target to any open patcher by name
- [2026-03-30] get_top_patcher() fix for Wind traversal when max.frontpatcher is null
- [2026-03-30] Knowledge base: patcher-targeting, bridge-subpatcher, wind-traversal docs
- [2026-03-30] feature/opencode-integration merged into develop
- [2026-03-30] Console reading ported from upstream PR #1 (get_max_console, clear_max_console, clear_console_buffer)
- [2026-03-30] Console source capture added via [tosymbol] + [pack s s 0] pattern

## In Progress

- Test console source capture in Max, then commit on feature/console-reading

## Next

- Merge feature/console-reading into develop
- Port large patch chunking fix from upstream PR #1 (commit e6e043b)
- Test all 31 MCP tools through targeted patchers
- Consider contributing improvements upstream to ersatzben/maxmsp-mcp
- Update AGENTS.md with console tool documentation
