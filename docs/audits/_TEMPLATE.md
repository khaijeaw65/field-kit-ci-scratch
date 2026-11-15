# Audit — BRIEF-### <Title>

| | |
|---|---|
| **Auditor** | <tool> (assigned by <source>) · **Date** YYYY-MM-DD |
| **Brief revision** | <n> · **Audited S** `<sha>` · **Lock commit** `<sha>` |
| **Flags** | <from brief — where to look first> |
| **Recommendation** | PASS · CHANGES REQUIRED · BLOCKED |

## Checklist
| Check | Result |
|---|---|
| ACs met (each with evidence) | |
| Logic / race / security on flagged areas | |
| e2e covers the test plan — no weak or missing case | |
| Lock red-proof present; lock SHA = first lock commit in git log; net post-lock e2e diff reviewed | |
| Protected paths covered; every `Approved-by` trailer matches the §9 unlock list or an *Owner approvals* row | |
| Triage matches the diff (e.g. runtime code changed ↔ run proof on) | |
| `ui.md` state rows + action-table failures *(ui)* | |
| Rule IDs tagged `[review]` | |
| Handoff complete (gates, run proof, disclosures) | |

## Findings
| # | Rule ID | Must fix / Suggest | `path:line` | Current → Updated |
|---|---|---|---|---|
| 1 | | | | |

`Suggest` never blocks PASS.

## Next
`Next → in <Executor>: ship BRIEF-###` · `fix BRIEF-### (#…)` · BLOCKED: <DR / decision needed>

<!-- Re-audits append: ## Re-audit — YYYY-MM-DD · <new S> -->
