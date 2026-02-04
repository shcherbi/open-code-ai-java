#!/bin/bash
# configure-opencode.sh - Generate opencode.json from template
# Usage: ./configure-opencode.sh [project-directory]

set -e

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"

PROJECT_DIR="$(cd "${1:-.}" && pwd)"
TEMPLATE_FILE="$WORKSPACE_DIR/templates/opencode.json.template"
OUTPUT_FILE="$PROJECT_DIR/opencode.json"

[ ! -f "$TEMPLATE_FILE" ] && echo "❌ Template not found: $TEMPLATE_FILE" && exit 1

# Prompt for local filesystem root MCP
read -p "Local filesystem root for MCP [${PROJECT_DIR}]: " INPUT_ROOT
PROJECT_ROOT=${INPUT_ROOT:-$PROJECT_DIR}

# Generate opencode.json from template
sed -e "s|{{PROJECT_ROOT}}|$PROJECT_ROOT|g" \
    "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo "✅ OpenCode config generated at $OUTPUT_FILE"
