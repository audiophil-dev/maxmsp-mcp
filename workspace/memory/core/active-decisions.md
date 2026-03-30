# Active Decisions

## AD-001: OpenCode Integration Approach

**Date**: 2026-03-30
**Status**: Active
**Decision**: Set up OpenCode integration alongside existing Claude Code integration (.claude/skills/). Both can coexist in the same repo.
**Rationale**: OpenCode provides MCP server configuration, memory bank, knowledge base, and agent infrastructure that Claude Code does not. The existing CLAUDE.md and .claude/skills/ remain functional for Claude Code users.

## AD-002: docs.json as Symlink

**Date**: 2026-03-30
**Status**: Active
**Decision**: Symlink docs.json from project root into workspace/docs/knowledge/max-msp/objects/ rather than copying.
**Rationale**: docs.json is 6.15 MB. A symlink avoids duplication and ensures the knowledge base always references the current version.

## AD-003: Project-Level opencode.json in .opencode/

**Date**: 2026-03-30
**Status**: Active
**Decision**: Create opencode.json inside `.opencode/` directory with only project-specific settings (MCP server). OpenCode merges this with the global config.
**Rationale**: `.opencode/` is the standard project-level config directory. Keeps project config minimal and focused. Global settings (providers, compaction, etc.) come from ~/.config/opencode/opencode.json.

## AD-004: parentpatcher Auto-Detection for Bridge

**Date**: 2026-03-30
**Status**: Active
**Decision**: Both max_mcp.js and max_mcp_v8_add_on.js use `this.patcher.parentpatcher ? this.patcher.parentpatcher : this.patcher` at initialization to support bridge-as-subpatcher.
**Rationale**: Allows the MCP bridge wiring to live inside `p mcp_bridge` while targeting the parent workspace patcher. Falls back to `this.patcher` when at top level, preserving backward compatibility with the original demo.maxpat.

## AD-005: get_top_patcher() for Wind Traversal

**Date**: 2026-03-30
**Status**: Active
**Decision**: Use `get_top_patcher()` (walk up parentpatcher chain) instead of `max.frontpatcher` for Wind traversal entry point.
**Rationale**: `max.frontpatcher` returns null in both js and v8 engines when code runs inside a subpatcher. Walking up the parentpatcher chain reliably reaches the top-level patcher whose `.wind` property provides access to all open windows.
