## 📦 github_IA-inference

###### 🚀 Exécuter des inférences IA dans GitHub Actions grâce au GitHub Copilot CLI.

》》 Ce projet fournit un exemple complet et fonctionnel montrant comment intégrer l’IA (Copilot) dans vos pipelines CI/CD GitHub. Il démontre comment :
```text
- installer le Copilot CLI sur un runner GitHub,
- exécuter une inférence IA,
- utiliser des prompts inline, des fichiers .txt, ou des prompts structurés .prompt.yml,
- récupérer la réponse IA dans la sortie du workflow ou dans un fichier temporaire.
```

>>Ce dépôt sert de template pour tout développeur souhaitant ajouter une étape IA dans ses workflows GitHub.

---

### 🧠 Fonctionnalités
```text
- Inférence IA via GitHub Copilot CLI
- Support des modèles : gpt-4.1, claude-sonnet-4.5, etc.
- Prompts inline, fichiers texte, fichiers YAML structurés
- System prompt externe
- Injection de variables et fichiers dans les prompts
- Récupération de la réponse IA dans un fichier
- Workflow CI/CD prêt à l’emploi
```

---

### 📁 Structure du projet

```text
VOIR docs/structure.md
```

---

### 📤 Sorties

| Nom | Description |
|------|-------------|
| response | Texte de la réponse IA |
| response-file | Chemin du fichier contenant la réponse |

### 🔐 Authentification Copilot CLI

- *Le workflow nécessite* **un token Copilot** :

```markdown
COPILOT_PAT
```

- *À ajouter dans* :

》》 **Settings → Secrets → Actions → New secret**

---

### 🎯 Objectif du projet

Ce dépôt sert de modèle pour :
```text
- intégrer Copilot IA dans vos workflows GitHub,
- automatiser des tâches textuelles (résumés, analyses, génération de documentation),
- démontrer l’usage avancé du Copilot CLI dans CI/CD.
```

>>Il peut être cloné et adapté pour n’importe quel projet nécessitant une étape IA automatisée.

---

### 🛠️ Publier une nouvelle version

>>Ce projet inclut un script script/release permettant de tagger et publier une nouvelle version de l’action.

---

