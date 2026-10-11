#!/usr/bin/env bash
# PT-BR: Gate de qualidade. Roda lint, typecheck e testes se existirem no projeto e para no primeiro erro.
# Gate: runs lint, typecheck and tests if the project has them. Fails on the first error.
set -e

if [ -f pnpm-lock.yaml ]; then PM="pnpm"
elif [ -f yarn.lock ]; then PM="yarn"
elif [ -f bun.lockb ] || [ -f bun.lock ]; then PM="bun"
else PM="npm"; fi

has_script() {
  node -e "const s=(require('./package.json').scripts||{}); process.exit(s['$1']?0:1)" 2>/dev/null
}

run() {
  echo ""
  echo ">>> $1"
  shift
  "$@"
}

if [ -f package.json ]; then
  has_script lint && run "lint" $PM run lint || echo "(no lint script, skipped)"

  if has_script typecheck; then
    run "typecheck" $PM run typecheck
  elif [ -f tsconfig.json ]; then
    run "typecheck (tsc)" npx --no-install tsc --noEmit
  else
    echo "(no typecheck, skipped)"
  fi

  if has_script test; then
    CI=true run "tests" $PM run test
  else
    echo "(no test script, skipped)"
  fi
else
  echo "package.json not found: adapt scripts/gate.sh to this project."
  exit 1
fi

echo ""
echo "GATE OK"
