#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
PROJECT_DIR="${1:-$SCRIPT_DIR}"
VIEWER_URL="https://github.com/Egonex-AI/Understand-Anything/releases/latest/download/understand-anything-viewer.tgz"

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Error: project directory not found: $PROJECT_DIR" >&2
  exit 1
fi

PROJECT_DIR="$(cd -- "$PROJECT_DIR" && pwd -P)"

if [[ ! -f "$PROJECT_DIR/.ua/knowledge-graph.json" \
   && ! -f "$PROJECT_DIR/.understand-anything/knowledge-graph.json" ]]; then
  echo "Error: no UA knowledge graph found in: $PROJECT_DIR" >&2
  echo "Run the Understand Anything analysis first, then try again." >&2
  exit 1
fi

echo "Starting UA dashboard for: $PROJECT_DIR"
echo "The terminal will print a URL containing ?token=...; use the full URL."

if [[ -n "${UA_DASHBOARD_PORT:-}" ]]; then
  exec npx --yes "$VIEWER_URL" "$PROJECT_DIR" --port "$UA_DASHBOARD_PORT"
fi

exec npx --yes "$VIEWER_URL" "$PROJECT_DIR"
