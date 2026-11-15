# Agent Boundaries — field-kit CI scratch

> **Source of the protected list (a compact copy is in `AGENTS.md`). All agents. No exceptions.**
> Protected files are never edited by agents on their own initiative — not even with a comment or TODO. If one needs changing → raise a DR (`docs/decisions/_TEMPLATE.md`) or ask Field, and stop that path. An agent may edit a protected file **only with Field's explicit approval of the exact change** (see *Field-approved edits*).
> Guard: `AGENTS.md`. Workflow: `docs/rules/workflow.md`.

---

## Files Agents MUST NOT Modify

### Root Config
```
package.json
.gitignore
```
App-level dependency manifests: only after an Approved DR or an exact brief Pre-decided item.

### Agent Rules & Instructions (never brief-unlockable)
```
CLAUDE.md, AGENTS.md          ← root and nested (`app/*/CLAUDE.md`, `app/*/AGENTS.md`)
docs/rules/**
.cursor/rules/**
.agents/rules/**
```

### Infrastructure & Enforcement
```
infra/**
.github/**                   ← workflows, CODEOWNERS, PR template
.githooks/**                 ← kit enforcement (never brief-unlockable)
ops/gates/**                 ← kit enforcement (never brief-unlockable)
scripts/field-kit/**         ← kit enforcement, incl. check-lock.sh (never brief-unlockable)
```
### Workflow & Spec Documents (ownership-restricted)
```
docs/features/**          ← Spec-Anchored feature requirements & design. Cowork creates/revises with Field approval; executors update only `design.md` status/code map rows explicitly listed in the brief's Tasks/Build steps within the brief PR
docs/briefs/**            ← Field only. Cowork writes Drafts and sets Ready after Field approves (uncommitted); the executor moves the brief into its worktree and commits it unchanged in the seed commit. Executors never edit briefs
acceptance e2e files      ← written by the executor at Step 0 from the brief's test plan; LOCKED from the `test(BRIEF-###): acceptance (red)` commit on, together with the e2e runner config present at that commit (`jest-e2e.json`, `vitest*.config.*`, `playwright.config.*`). A later change needs Field's OK and a commit with `Approved-by: Field (e2e-change)`; the audit reviews the net diff since the lock
docs/decisions/**         ← anyone may CREATE a Pending DR. Only Field writes Decision/Status (Cowork may record an explicit decision)
docs/audits/**            ← assigned auditor only. The executor commits the report unchanged in the ship commit (packaging only)
docs/handoffs/**          ← the brief's executor
```

---

## Field-approved edits

Any protected file may be edited when Field approves the specific change in the session (explicit OK on the exact diff/text before it is written). Commit trailer: `Approved-by: Field (session)` — or `Approved-by: Field (e2e-change)` for a locked e2e file. Record each one as a row in the handoff's *Owner approvals* table when the OK is given; the audit checks every trailer against the brief's §9 unlock list or that table.
- Approval covers that change only.
- The agent proposes the diff and writes it after the OK — never hands the edit to Field as manual work.
- Where it lands: the current executor's next commit (implementation), the next seed commit, or a docs branch (planning).
- No approval in the session → no edit: raise a DR or ask, and stop that path.
- Inside a brief, executors edit protected files only via the brief's exact unlock list (brief §9 *Guard — unlocks*, populated during the Planner Dry Run).

---

## Brief Unlocks

A Ready brief may list **exact paths** under *Unlocked protected files* (verified during the Planner Dry Run before Ready).
- Edit **only those paths, only within that brief**. No globs.
- **Only unlockable:** Root Config, app wiring entrypoints (`main.ts`, `app.module.ts`), Infrastructure (except `.github/CODEOWNERS` and `.github/pull_request_template.md`).
- **Never unlockable:** Agent Rules & Instructions, CODEOWNERS, PR template, kit enforcement (`.githooks/**`, `ops/gates/**`, `scripts/field-kit/**`), Workflow Documents. Locked e2e files change only through the `(e2e-change)` path above.
- **Packaging is not editing:** the seed commit (brief, defect, feature files moved unchanged) and the ship commit (audit report unchanged + handoff) need no trailer.
- A DR approval alone does not unlock a protected file.

---

## What To Do Instead

| Situation | Action |
|---|---|
| Any dependency change | Allowed only if approved (exact Pre-decided item or Approved DR). Otherwise raise a DR and stop that path |
| Brief or a locked e2e looks wrong / incomplete | Raise a DR (Category: Brief deviation) or ask Field; a locked e2e changes only via `(e2e-change)` |
| Schema needs a change | Raise a DR (Category: Data); optional SQL sketch inside the DR |
| Workflow / infra / CI change needed | Propose the exact diff for Field's OK (*Field-approved edits*), or raise a DR when it's a real decision; infra/CI can also go through a brief unlock list |
| A rule looks wrong | Raise a DR or ask Field — never leave comments inside rule files |

---

## Why This Exists

- Root configs affect every package — a wrong edit breaks the whole build.
- Agent rule files and locked acceptance tests stay out of the coding agent's reach after the lock, so no executor can weaken its own grading criteria once it has seen them fail.
- Infra/CI files need deliberate review; an accidental change can remove the review requirement itself.

## Layer 1 Enforcement (Hard)

Server-side protection on `main` per `ops/github/README.md` — **solo** profile (PR required, 0 approvals, `ci` required, nobody bypasses) or **team** profile (review ruleset with Field bypass for review only + CI ruleset nobody bypasses); merge commits only. Private repos need a paid GitHub plan for either; without one, the process guard in workflow Section 7 is the only layer.
**Applying a ruleset changes GitHub settings: the git hand runs it only after Field's explicit OK.**
