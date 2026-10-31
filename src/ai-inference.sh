#!/usr/bin/env bash
set -euo pipefail

PROMPT_FILE="${1:-.github/prompts/sample.prompt.yml}"
SYSTEM_FILE="${2:-.github/prompts/system.txt}"
OUTPUT_FILE="${3:-artifacts/diff.txt}"

MODEL="${MODEL:-gpt-4.1}"
TASK_TYPE="${TASK_TYPE:-generic}"
CONFIG_FILE="config/models.yml"

MAX_TOKENS="${MAX_TOKENS:-4096}"
MAX_CALLS_PER_WORKFLOW="${MAX_CALLS_PER_WORKFLOW:-10}"
MODEL_TIER="${MODEL_TIER:-standard}"

mkdir -p artifacts

select_model() {
  if [[ -f "${CONFIG_FILE}" ]] && command -v yq >/dev/null 2>&1; then
    yq ".tasks.${TASK_TYPE}.model // \"${MODEL}\"" "${CONFIG_FILE}"
  else
    echo "${MODEL}"
  fi
}

# Cost guard
CURRENT_CALLS=$(cat artifacts/calls.count 2>/dev/null || echo 0)
if (( CURRENT_CALLS >= MAX_CALLS_PER_WORKFLOW )); then
  echo "[COST-GUARD] Limite d'appels IA atteinte (${MAX_CALLS_PER_WORKFLOW})."
  exit 0
fi
echo $((CURRENT_CALLS+1)) > artifacts/calls.count

# Model tier guard
if [[ "${MODEL_TIER}" == "low-cost" ]]; then
  MODEL="gpt-4.1-mini"
fi

RESOLVED_MODEL="$(select_model)"

echo "[IA] Model: ${RESOLVED_MODEL}"
echo "[IA] Task: ${TASK_TYPE}"
echo "[IA] Prompt: ${PROMPT_FILE}"
echo "[IA] System: ${SYSTEM_FILE}"

copilot exec \
  --model "${RESOLVED_MODEL}" \
  --prompt-file "${PROMPT_FILE}" \
  --system-file "${SYSTEM_FILE}" \
  --output "${OUTPUT_FILE}"

cat <<EOF > artifacts/cost.json
{
  "model": "${RESOLVED_MODEL}",
  "tokens_max": "${MAX_TOKENS}",
  "calls_used": "$(cat artifacts/calls.count)",
  "tier": "${MODEL_TIER}"
}
EOF
