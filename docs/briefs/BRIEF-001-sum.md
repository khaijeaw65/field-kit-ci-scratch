# BRIEF-001 — sum() helper (CI smoke test)

| | |
|---|---|
| **Owner** | Field · **Implementer** kj (Cowork VM, scratch) · **Auditor** Cowork (fallback Codex) |
| **Type** | Chore |
| **Link** | `standalone` (cites `docs/FRD.md` core flow) |
| **Status** | Ready · **Revision** 1 |
| **Depends on** | none · **Unblocks** none |
| **Sections on** | `e2e` `guard` |
| **Flags** | none |

## 1. Goal
Smallest real brief that makes the CI jobs `checks`, `lock` and `ci` run on GitHub Actions.

## 2. Scope
**In:** `src/sum.mjs`, its acceptance test, `package.json` + lockfile, CI services trimmed. **Out:** any app code.

## 3. Acceptance Criteria
| AC | When | Then |
|---|---|---|
| 1 | `sum(2, 3)` | returns `5` |
| 2 | `sum` called with a non-number | throws `TypeError` |

## 4. Code map
| File | Owns |
|---|---|
| `src/sum.mjs` | `sum(a, b)` |
| `test/sum.test.mjs` | acceptance tests |

## 5. Gates
```bash
npm run test:e2e
```

## 6. Acceptance test plan  *(e2e)*
| AC | Given | When | Then | File |
|---|---|---|---|---|
| 1 | module loaded | `sum(2, 3)` | `5` | `test/sum.test.mjs` |
| 2 | module loaded | `sum('2', 3)` | throws `TypeError` | `test/sum.test.mjs` |

## 9. Guard — unlocks and pre-decided items  *(guard)*
- **Unlocked protected files:** `package.json`, `package-lock.json`, `.github/workflows/ci.yml` (remove the unused postgres/redis services only).
- **Pre-decided:** no dependencies; Node built-in `node:test`. Source: Field, session, 2026-11-15.

## 11. Build steps
| # | Step | Done when |
|---|---|---|
| 0 | Write `test/sum.test.mjs` from §6 → red → lock commit | red assertion output |
| 1 | `src/sum.mjs` + `package.json` (`test:e2e`) + lockfile | `npm run test:e2e` green |
| 2 | Trim CI services | workflow valid |

## Changelog
| Rev | Date | Change |
|---|---|---|
| 1 | 2026-11-15 | Initial draft |
