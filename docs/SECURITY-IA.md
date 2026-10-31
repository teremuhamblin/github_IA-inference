# Sécurité IA — gestion des secrets

## COPILOT_PAT
- Scope minimal : read:org, read:repo
- Rotation recommandée : tous les 90 jours
- Stockage : GitHub Secrets + Environments

## Environments
- `env:prod` : modèles coûteux, quotas stricts
- `env:dev` : modèles moins chers, tests
