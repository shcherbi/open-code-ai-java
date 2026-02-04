#!/bin/bash
# setup-project.sh - Orchestrate project setup
# Usage: ./setup-project.sh [project-directory]

set -e

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

PROJECT_DIR="$(cd "${1:-.}" && pwd)"

echo "ℹ️  Setting up project in $PROJECT_DIR"

# Step 1: Link skills
"$SCRIPT_DIR/link-skills.sh" "$PROJECT_DIR"

# Step 2: Generate AGENTS.md
"$SCRIPT_DIR/generate-agents-md.sh" "$PROJECT_DIR"

# Step 3: Configure OpenCode (opencode.json + MCP)
"$SCRIPT_DIR/configure-opencode.sh" "$PROJECT_DIR"

echo "✅ Setup complete!"
