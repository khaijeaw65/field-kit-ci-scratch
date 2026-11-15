# BRIEF-### — <Title>

| | |
|---|---|
| **Owner** | Field · **Implementer** <id> (<tool>) · **Auditor** Cowork (fallback Codex) |
| **Type** | Feature · Defect · Chore |
| **Link** | `Feature: <f>` → [requirements](../features/<f>/requirements.md) · `Defect: DEFECT-###` · `standalone` (cites `docs/FRD.md` section) |
| **Status** | Draft · Ready (merged PR = Done) · **Revision** 1 |
| **Depends on** | <`BRIEF-###` — merged / not merged · or `none`> · **Unblocks** <`BRIEF-###` or `none`> |
| **Sections on** | <tokens: `e2e` `runproof` `ui` `guard` `repro`> |
| **Flags** | <none · or: new pattern · concurrency/tx · money/auth/personal data · integration · migration on existing rows · unknowns> — hard flags ≤ 1 (or `owner-accepted oversize`) |

## 1. Goal
<1–2 plain lines: who gets what outcome; requirement IDs `R1..Rn` if a feature brief.>

## 2. Scope
**In:** <ACs / files / modules.> **Out:** <excluded items and where they go.>

## 3. Acceptance Criteria
| AC | When | Then |
|---|---|---|
| 1 | <trigger> | <observable result> |

## 4. Code map
| File | Owns |
|---|---|
| `<path>` | <responsibility> |

## 5. Gates
```bash
<lint> · <typecheck / build> · <unit> · <e2e (if e2e on)>
```

<!-- ===== Switchable sections: keep only those listed in "Sections on" ===== -->

## 6. Acceptance test plan  *(e2e · repro)*
Executor writes these at Step 0, runs them red, commits test files only as `test(BRIEF-###): acceptance (red)` — locked from then on.
| AC | Given | When | Then | File |
|---|---|---|---|---|
| 1 | <state> | <request / action> | <observable result> | `<test path>` |
*Type: Defect* → the first row is the repro from `DEFECT-###` (must fail red on current code).

## 7. Run proof  *(runproof)*
```bash
<start / rebuild> · <migrations> · <health check> · <real request on the changed path>
```
<!-- UI: name the screen + action. Defect: replay the repro. Not feasible → narrow it here before Ready. -->

## 8. UI  *(ui)*
<Screens and states from `ui.md` this brief delivers; tokens/components used.>

## 9. Guard — unlocks and pre-decided items  *(guard)*
- **Unlocked protected files** (exact paths, or `none`):
- **Pre-decided** (exact `pkg@version`, endpoint, schema change — each with `Source: Field, <how>, <date>`):

## 10. Planner Dry Run (before Ready — delete rows of sections that are off)
| # | Check | `path:line` evidence | Result |
|---|---|---|---|
| 1 | Existing schema / entities | | |
| 2 | Wiring trace + protected files listed in §9 | | |
| 3 | Packages & peer versions *(guard)* | | |
| 4 | Gate scripts exist | | |
| 5 | e2e isolation config exists, or isolation = Build step 1 *(e2e)* | | |
| 6 | Depends-on merged · no code-map overlap with briefs in flight | | |
| 7 | UI tokens & components exist *(ui)* | | |
| 8 | Contract nullability = DB nullability | | |
| 9 | Run proof feasible — accounts, keys, callbacks, devices *(runproof)* | | |

## 11. Build steps (inside → out · 1 step = 1 commit · stop after 2 failed fixes)
| # | Step | Done when |
|---|---|---|
| 0 | Verify executor *Assumed* rows · write e2e from §6 → red → lock commit *(e2e/repro)* | red assertion output in handoff |
| 1 | <step> | <check green> |
| N | Gates + run proof + sync `design.md` / living docs | all green, proof recorded |

## Changelog
| Rev | Date | Change |
|---|---|---|
| 1 | YYYY-MM-DD | Initial draft |
