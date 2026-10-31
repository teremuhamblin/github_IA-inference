#!/usr/bin/env bash
set -euo pipefail

PROMPT_FILE="${1:-.github/prompts/sample.prompt.yml}"
SYSTEM_FILE="${2:-.github/prompts/system.txt}"
OUTPUT_FILE="${3:-artifacts/diff.txt}"
MODEL="${MODEL:-gpt-4.1}"
TASK_TYPE="${TASK_TYPE:-generic}"

CONFIG_FILE="config/models.yml"

select_model() {
  if command -v yq >/dev/null 2>&1; then
    yq ".tasks.${TASK_TYPE}.model // \"${MODEL}\"" "${CONFIG_FILE}"
  else
    echo "${MODEL}"
  fi
}

RESOLVED_MODEL="$(select_model)"

echo "[IA] Model: ${RESOLVED_MODEL}"
echo "[IA] Prompt: ${PROMPT_FILE}"
echo "[IA] System: ${SYSTEM_FILE}"

copilot exec \
  --model "${RESOLVED_MODEL}" \
  --prompt-file "${PROMPT_FILE}" \
  --system-file "${SYSTEM_FILE}" \
  --output "${OUTPUT_FILE}"
