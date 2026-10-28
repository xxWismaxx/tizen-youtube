#!/usr/bin/env sh
# Moves the service proxy off 8099, which Vetro already listens on.
# Usage: fork/patch.sh <checkout of an upstream tag>
set -eu

FROM=8099
TO=8098

cd "${1:-.}"

git grep -lw "$FROM" -- . ':!docs' | xargs sed -i "s/\b$FROM\b/$TO/g"

if git grep -nw "$FROM" -- . ':!docs'; then
    echo "patch.sh: $FROM is still present after patching" >&2
    exit 1
fi

# The port the package step reads must be the new one, or the build is not patched.
node -e "const p = require('./tizen.config.json').ports.proxy; if (p !== $TO) { console.error('proxy is ' + p); process.exit(1); }"
