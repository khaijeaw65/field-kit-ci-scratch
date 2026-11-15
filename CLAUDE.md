# CLAUDE.md — field-kit CI scratch

> Rendered from the same source as `AGENTS.md` — identical text, both tracked by `/sync-rules`. Inline on purpose: some Claude surfaces (e.g. Cowork) do not follow `@` imports.

> Always loaded by every agent and tool. Single source for project context, the Field Guard and hard rules.
> Process detail: `docs/rules/workflow.md` (read the section a command names). Docs map: `docs/README.md`.

## Project
Throwaway repo to verify the field-kit 0.1.0 CI template (checks, lock, aggregate ci) and the ruleset on real GitHub Actions.
Core flow: **brief → lock → green → push → ci** — finish it end-to-end before adding breadth.
**Team:**
- KJ — Owner / executor · decision owner (Field)

## Stack (locked — change only through an Approved DR)
| Layer | Choice |
|---|---|
| — | decided by the first DRs |

## Scoped rules — read before editing
| Path | Rule file |
|---|---|
| — | none yet |
Editing `<app>/**` → read its rule file first, even if your tool did not load it. Workspace bans: `docs/rules/core.md`.

## Session start
1. Identity: `.agent-local.json` in the main checkout. Read your local state `.field-kit/state/<id>-<kind>.md` (`<kind>` = `planning` or `BRIEF-###`; from a worktree: `../../.field-kit/state/`) and only the files it lists.
2. Open with: where work stands · branch / worktree · next action. Then do the next action.
3. Before rotating out of a long session: `/checkpoint`.

## Field Guard — decisions go through Field
Field is the only decision authority. Agents recommend or execute an explicit decision.

| Trigger (must flag — never decide alone) | Examples |
|---|---|
| Dependencies | any new / removed / upgraded package in any dependency manifest |
| Brief / e2e deviation | contract or DTO differs, an AC can't be met as written, a **locked e2e needs a change**, any work outside the brief's scope |
| Flow / architecture | new module, cross-module import, endpoint or event not in the brief / `design.md`, bypassing a locked rule, changing the core flow |
| Data | schema change, migration not implied by the brief, shared contract / enum change |
| Sensitive | auth, payment, personal-data behaviour |

**Not triggers (just do it):** private helpers, naming, refactors inside the brief's own files, unit-test structure, WHY comments.

**Approved** = exactly one of: (a) an exact item in the current Ready brief — its *Pre-decided* list, or the Contracts / Code map of its linked `design.md`, or its `ui.md` — traced to Field by a *Source* row; or (b) an `Approved` DR. Anything beyond the exact wording is a deviation → new DR. A DR never unlocks a protected file.

**Procedure:** stop that path only (continue unblocked work) → `/new-dr` → note it under Blockers in the brief / handoff → start your reply with `FIELD REVIEW NEEDED: DR-### — <one line>`. Only Field writes a Decision; Cowork may record one only when Field states it explicitly in the session. Silence or "looks good" is never approval.

## Protected paths (full rules: `docs/rules/agent-boundaries.md`)
Never edit without an exact brief unlock (brief §9 *Guard — unlocks*) or Field's OK on the exact diff in this session (`Approved-by: Field (session)` trailer):
`CLAUDE.md` · `AGENTS.md` (root and nested `app/*/`) · `docs/rules/**` · `.cursor/rules/**` · `.agents/rules/**` · `.github/**` · `infra/**` · kit enforcement `.githooks/**`, `ops/gates/**`, `scripts/field-kit/**` (never brief-unlockable) · root config (any dependency manifest and friends) · `docs/features/**`, `docs/briefs/**`, `docs/decisions/**` (ownership rules) · **e2e files and e2e runner config after their lock commit** (change only with `Approved-by: Field (e2e-change)`).

## Hard rules
1. **Never decide alone** — Guard triggers go through a DR.
2. **Never audit work you implemented, fixed or paired on** — refuse and name Cowork.
3. **Not run is never pass** — a required gate or run proof not run → status `BLOCKED`, never `Implemented`. Report exact commands, exits, limits.
4. **2-attempt stop** — a step still red after 2 fix attempts → stop and report.
5. **Bans (`docs/rules/core.md`):** no type cheats (`as any`, `as unknown as`, `@ts-ignore`), no silent catch or invented `?? ''` fallbacks, no fake tests, no dead code / shims.
6. **Do not reintroduce cut features:** none yet.
7. **Every brief runs in its own worktree** `.worktrees/BRIEF-###`; the main checkout stays on `main`. Never `git worktree prune` / `remove` from a VM session.
8. **Never push to `main`**; merge only through `pr-review` (merge commit only). `.env*` files are never committed.

## Commands (detail: `docs/rules/workflow.md` Section 4)
`/new-brief` (default entry) · `/new-feature` · `/new-defect` · `/new-dr` · `execute BRIEF-###` · `fix BRIEF-### (#…)` · `ship BRIEF-###` · `audit BRIEF-###` · `/review` · `pr-review` (`approve merge BRIEF-###`) · `/checkpoint` · `resume` · `/autopilot` · `onboard <id>` · `status BRIEF-###` · `handoff`.
Tools without these skills: find the command in `docs/rules/workflow.md` Section 4 and read the section its row names before acting.


## Claude-only
- Claude Code loads `<app>/CLAUDE.md` when you work inside an app folder; it points to that app's rule file.
- Skills (`/new-brief`, `/execute`, `/audit`, …) read the workflow sections they need — do not load all of `docs/rules/workflow.md` up front.
