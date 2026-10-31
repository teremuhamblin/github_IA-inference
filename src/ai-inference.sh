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
if [[ "${MAX_CALLS_PER_WORKFLOW}" -gt 0 ]]; then
  CURRENT_CALLS=$(cat artifacts/calls.count 2>/dev/null || echo 0)
  if (( CURRENT_CALLS >= MAX_CALLS_PER_WORKFLOW )); then
    echo "[COST-GUARD] Limite d'appels IA atteinte (${MAX_CALLS_PER_WORKFLOW})."
    exit 0
  fi
  echo $((CURRENT_CALLS+1)) > artifacts/calls.count
fi

RESOLVED_MODEL="$(select_model)"

echo "[IA] Model: ${RESOLVED_MODEL}"
echo "[IA] Prompt: ${PROMPT_FILE}"
echo "[IA] System: ${SYSTEM_FILE}"

copilot exec \
  --model "${RESOLVED_MODEL}" \
  --prompt-file "${PROMPT_FILE}" \
  --system-file "${SYSTEM_FILE}" \
  --output "${OUTPUT_FILE}"
