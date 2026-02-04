#!/bin/bash
# test-all.sh - Test all setup scripts
# Usage: ./scripts/test-all.sh

set -e

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"

# Create temp directory, cleanup on exit
TEST_DIR=$(mktemp -d)
trap "rm -rf $TEST_DIR" EXIT

echo "Testing in: $TEST_DIR"
echo ""

PASS=0
FAIL=0

check() {
    local description="$1"
    shift
    if "$@" 2>/dev/null; then
        echo "  ✓ $description"
        PASS=$((PASS + 1))
    else
        echo "  ✗ $description"
        FAIL=$((FAIL + 1))
    fi
}

# Test 1: link-skills.sh
echo "Testing link-skills.sh..."
"$SCRIPT_DIR/link-skills.sh" "$TEST_DIR" > /dev/null 2>&1
check ".opencode directory created" [ -d "$TEST_DIR/.opencode" ]
check "skill symlink created" [ -L "$TEST_DIR/.opencode/skill" ]
LINK_TARGET=$(readlink "$TEST_DIR/.opencode/skill" 2>/dev/null || echo "")
check "symlink points to workspace" [ "$LINK_TARGET" = "$WORKSPACE_DIR/.opencode/skill" ]
echo ""

# Test 2: generate-agents-md.sh
echo "Testing generate-agents-md.sh..."
"$SCRIPT_DIR/generate-agents-md.sh" "$TEST_DIR" > /dev/null 2>&1
check "AGENTS.md created" [ -f "$TEST_DIR/AGENTS.md" ]
check "AGENTS.md has content" [ -s "$TEST_DIR/AGENTS.md" ]
echo ""

# Test 3: configure-opencode.sh
echo "Testing configure-opencode.sh..."
printf "\\n" | "$SCRIPT_DIR/configure-opencode.sh" "$TEST_DIR" > /dev/null 2>&1
check "opencode.json created" [ -f "$TEST_DIR/opencode.json" ]
check "opencode.json has content" [ -s "$TEST_DIR/opencode.json" ]
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Results: $PASS passed, $FAIL failed"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

[ $FAIL -eq 0 ] && exit 0 || exit 1
