# Handoff — BRIEF-### <Title>

| | |
|---|---|
| **Implementer** | <id> (<tool>) · **Brief revision** <n> · **Date** YYYY-MM-DD |
| **Branch** | `feat/BRIEF-###-<slug>` (worktree `.worktrees/BRIEF-###`) |
| **Status** | Implemented — awaiting audit · Changes requested · Audit PASS · BLOCKED |

> Committed as S. After the push, append **Work commit** and **CI run** below (uncommitted — they land in the ship commit H).

**Work commit:** `<S>` · **CI run:** <url>

## Gates
| Gate | Command | Exit | Result |
|---|---|---|---|
| Lint | `<cmd>` | 0 | |
| Typecheck | `<cmd>` | 0 | |
| Unit | `<cmd>` | 0 | <n> passed |
| e2e | `<cmd>` | 0 | <n> passed |
Not run → say why; status is `BLOCKED`, not Implemented. `--no-verify` used → say so here.

## Acceptance lock
Lock commit `<sha>` (pushed right after Step 0) · CI run on it: <url> — red output (assertion, not import error):
```text
<failing assertion excerpt>
```

## Owner approvals
One row per commit carrying `Approved-by:` (`session` · `e2e-change`), written when the OK is given. None → `none`.

| Trailer | Commit | What the owner OK'd (file + change) | Date |
|---|---|---|---|
| | | | |

## Run proof
<What ran (stack, migrations, health), the request on the changed path and its result in words. UI / defect: what was exercised. Screenshots in `.field-kit/proof/` (untracked): `<file>` — <what it shows>.>

## AC check
| AC | Met? | Evidence (test / step) |
|---|---|---|
| 1 | ✅ / ❌ | |

## Disclosures
- **Spec vs reality gaps:** <…>
- **Compromises:** <…>
- **Callers affected** (shared service / repository / transaction boundary changed → caller tests re-run): <…>
- **Out-of-scope defects found:** <none · or `DEFECT-###` logged>
- **Living docs updated / env keys / migrations to run:** <…>

<!-- Fix rounds append here:
### Fix round <N> — <new S>
- Findings fixed: #…
- Gates re-run: <commands + results> · Run proof: <…> · Caller tests: <…>
-->
