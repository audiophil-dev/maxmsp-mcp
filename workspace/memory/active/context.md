# Current Context

## Current Focus

[2026-03-30] Console reading implemented on feature/console-reading branch. Source capture added via [tosymbol] + [pack s s 0] pattern. Ready to test, then merge to develop.

## Immediate Goals

1. Test console reading with source names in Max
2. Merge feature/console-reading into develop
3. Consider porting large patch chunking fix from upstream PR #1

## Blockers

None currently.

## Recent Activity

- [2026-03-30] Created git-flow structure: main -> develop -> feature branches
- [2026-03-30] Merged feature/opencode-integration into develop
- [2026-03-30] Ported console reading from upstream PR #1 (3 commits on feature/console-reading)
- [2026-03-30] Fixed [console] outlet count (3 outlets, not 1)
- [2026-03-30] Discovered [pack s s 0] truncates multi-word messages; first fix used direct wiring (lost source)
- [2026-03-30] Added source capture: [console] outlet 1 -> [tosymbol] -> [pack s s 0] preserves full text
- [2026-03-30] Verified all 3 console tools working (get_max_console, clear_max_console, clear_console_buffer)
- [2026-03-30] Tested zl.join approach but failed: bang method triggers output instead of storing word "bang"
