# Docs map — field-kit CI scratch

New here? Read in this order:
1. `AGENTS.md` — project, stack, the Field Guard, hard rules.
2. `docs/FRD.md` — what the product does and which features exist.
3. `docs/rules/workflow.md` — how work flows (brief → execute → audit → PR).
4. `docs/rules/core.md` + the rule file for the app you touch.
5. The brief you are working on, and what it links to.

| Folder / file | What it is | Who writes | Read when |
|---|---|---|---|
| `FRD.md` | Product overview + feature list | Field (planning) | Starting any feature |
| `features/<f>/` | Deep spec of one feature (requirements, design, ui) | Planning session, Field-approved | Working on that feature |
| `features/INVARIANTS.md` | Rules that must never break | Planning session | Planning; diff touches *Touches* |
| `briefs/` | One executable slice each | Planning session | Executing / auditing it |
| `defects/` | Every defect: log, root cause, "caught at" | Planning session | Fixing it; improving rules |
| `decisions/` | One decision each (DR) | Anyone proposes; Field decides | Before touching what it locks |
| `handoffs/` | Executor evidence per brief | Executor | Auditing |
| `audits/` | Independent review per brief | Auditor | Reviewing / merging |
| `rules/` | Workflow, workspace and stack rules | Field (protected) | Session start / before editing |

## Living docs — update in the same PR as the change
| Doc | Owner | Update when |
|---|---|---|
| <`docs/schema.sql` / ERD> | <who> | <schema changes> |
| <`docs/api/README.md` / `openapi.json`> | <who> | <endpoint or DTO changes> |
| <`docs/infra.md`> | <who> | <infra changes> |
| <design system> | <who> | <tokens / components change> |
