#!/usr/bin/env sh
# ops/gates/pre-commit.sh — project linter on staged files. Adjust per stack.
set -e

STAGED=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(ts|tsx|js|jsx|mjs|cjs)$' | grep -v '^\.worktrees/' || true)

if [ -f package.json ] && [ -n "$STAGED" ]; then
  if [ -f pnpm-lock.yaml ]; then PKG=pnpm; else PKG=npm; fi
  if grep -q '"lint:staged"' package.json; then
    $PKG run lint:staged
  elif command -v oxlint >/dev/null 2>&1 || [ -x node_modules/.bin/oxlint ]; then
    printf '%s\n' "$STAGED" | tr '\n' '\0' | xargs -0 $PKG exec oxlint
  elif ls eslint.config.* >/dev/null 2>&1; then
    printf '%s\n' "$STAGED" | tr '\n' '\0' | xargs -0 $PKG exec eslint --no-warn-ignored
  fi
fi

if { [ -f build.gradle ] || [ -f build.gradle.kts ]; } && [ -x ./gradlew ]; then
  ./gradlew ktlintCheck --daemon
fi
