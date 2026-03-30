# Progress

## Completed

- [2026-03-30] OpenCode integration setup: .opencode/opencode.json, workspace structure, memory bank
- [2026-03-30] .opencode/AGENTS.md created from CLAUDE.md with Max/MSP MCP rules
- [2026-03-30] Python 3.12 venv created (3.14 incompatible with pydantic-core)
- [2026-03-30] opencode.json symlinked into DEVIALET_Max for cross-project access
- [2026-03-30] MCP connectivity verified (all basic tools work)
- [2026-03-30] parentpatcher auto-detection added to max_mcp.js and max_mcp_v8_add_on.js
- [2026-03-30] bridge_demo.maxpat created with p mcp_bridge subpatcher encapsulation
- [2026-03-30] list_patchers and target_patcher tools implemented and tested
- [2026-03-30] get_top_patcher() fix for Wind traversal (max.frontpatcher null in subpatchers)
- [2026-03-30] Knowledge base docs: patcher-targeting, bridge-subpatcher, wind-traversal
- [2026-03-30] Console reading ported (get_max_console, clear_max_console, clear_console_buffer)
- [2026-03-30] Console source capture via [tosymbol] + [pack s s 0] pattern
- [2026-03-30] feature/opencode-integration merged into develop
- [2026-03-30] feature/console-reading merged into develop (be4447e)
- [2026-03-30] All branches pushed to origin

## In Progress

- None

## Next

- Port large patch chunking fix from upstream PR #1 (commit e6e043b)
- Prepare upstream PRs for ersatzben/maxmsp-mcp
- Test all 31 MCP tools systematically
- Update AGENTS.md with console tool documentation

---

**Last Updated**: 2026-03-30
