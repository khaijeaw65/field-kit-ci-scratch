# Protecting `main` — field-kit CI scratch

Goal: nothing reaches `main` without a green `ci` check, and no agent can skip it.
`ci` = the aggregate job named `ci` in `.github/workflows/ci.yml` (it `needs:` every other job), run on every push to `feat/**`/`fix/**` and every PR to `main`.

## Layer 1 — process guard (always, free)

- Agents merge only via `pr-review` (`approve merge BRIEF-###`): it checks the gates on the exact head first.
- **Merge commits only** — never squash or rebase (the audit's `S..H` check needs the commits).
- Nobody pushes to `main`. Local safety net: `.githooks/pre-push` refuses any push to `refs/heads/main`.

A hook can be skipped (`--no-verify`), so Layer 1 stops accidents, not a determined agent.

## Layer 2 — GitHub enforces it (pick one profile)

**Plan limit:** public repos — any plan. **Private repos need GitHub Pro, Team or Enterprise**; on GitHub Free a private repo has no branch protection at all → Layer 1 only. On Pro with a *personal* repo, test once that the ruleset is enforced (some users report a "requires a Team organization" warning).

| Profile | When | Files | Admin bypass |
|---|---|---|---|
| **Solo** | only Field + agents write code | `ruleset-main-solo.json` | none — 0 approvals needed, so nobody has to bypass |
| **Team** | another developer writes code | `ruleset-main-review.json` + `ruleset-main-ci.json` | Field bypasses the **review only** (can't self-approve); CI has no bypass |

Team profile merge for Field's own / agent-opened PRs: `gh pr merge <n> --merge --admin` → skips the review rule only; GitHub still blocks until `ci` is green. That is the only allowed `--admin`.

## Apply (git hand, only after Field's explicit OK)

```bash
R=<owner>/<repo>
# solo
gh api -X POST repos/$R/rulesets --input ops/github/ruleset-main-solo.json
# team
gh api -X POST repos/$R/rulesets --input ops/github/ruleset-main-review.json
gh api -X POST repos/$R/rulesets --input ops/github/ruleset-main-ci.json
# verify
gh api repos/$R/rulesets --jq '.[] | {id,name,enforcement}'
```

Rollback: `gh api -X DELETE repos/$R/rulesets/<id>`.
