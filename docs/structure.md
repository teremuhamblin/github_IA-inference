# github_IA-inference
### 📁 Structure du projet
```text
github_IA-inference/
│
├── .github/
│   ├── github-README.adoc
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE/
│   ├── workflows/
│   │   └── ai-inference.yml
│   └── prompts/
│       ├── README.adoc
│       ├── prompt.txt
│       ├── sample.prompt.yml
│       └── system.txt
│
├── artifacts/
│   ├── README.rst
│   └── diff.txt
│
├── docs/
│   ├── README.rst
│   ├── structure.md
│   ├── architecture.md 
├── .gitignore
├── LICENSE.md
└── README.md
```

### 🎯 Résumé détaillé de la structure du projet githubIA‑inference

Le projet *github_IA‑inference* est organisé autour d’une architecture propre, modulaire et orientée vers l’automatisation de workflows IA via GitHub Actions. La structure se divise en quatre grands ensembles :
- La configuration GitHub, les artefacts générés, la documentation interne, et les fichiers racine du dépôt.

---

### 🧩 1. Dossier .github/
- — *Gouvernance, automatisation et prompts IA*

Ce dossier regroupe tous les éléments liés à la gestion du projet sur GitHub, incluant les templates, les workflows CI/CD et les prompts utilisés par le système d’inférence IA.

Contenu :
```text
- github-README.adoc  
  Documentation interne dédiée au dossier .github/.

- ISSUE_TEMPLATE/  
  Contient les modèles d’issues pour standardiser les rapports de bugs, demandes de fonctionnalités, documentation, etc.

- PULLREQUESTTEMPLATE/  
  Modèle de PR pour uniformiser les contributions.

- workflows/ai-inference.yml  
  Workflow GitHub Actions dédié à l’inférence IA.  
  Il orchestre l’exécution automatique des prompts, la génération de diffs, et les actions déclenchées lors des commits.

- prompts/  
  Dossier central pour la logique IA :
  - README.adoc : documentation expliquant le fonctionnement des prompts.  
  - prompt.txt : prompt principal utilisé par le workflow.  
  - sample.prompt.yml : exemple de prompt paramétré avec variables.  
  - system.txt : prompt système définissant les règles globales de l’IA.
```

---

### 📦 2. Dossier artifacts/
- — *Sorties générées par l’IA*

Ce dossier contient les artefacts produits automatiquement par les workflows IA.

Contenu :
```text
- README.rst  
  Documentation expliquant la nature des artefacts.

- diff.txt  
  Fichier de diff généré par l’IA, simulant ou décrivant les modifications apportées au projet.
```

---

### 📚 3. Dossier docs/
- — *Documentation technique du projet*

Ce dossier regroupe la documentation interne, utile pour comprendre l’architecture, la structure et les objectifs du projet.

Contenu :
```text
- README.rst  
  Introduction générale à la documentation.

- structure.md  
  Description détaillée de l’organisation du projet.

- architecture.md  
  Explication de l’architecture logicielle, des modules, et du fonctionnement interne.
```

---

### 🗂️ 4. Fichiers racine
- — *Métadonnées et documentation principale*

Ces fichiers définissent les règles globales du dépôt et fournissent les informations essentielles aux utilisateurs.

Contenu :
```text
- .gitignore  
  Liste des fichiers et dossiers ignorés par Git.

- LICENSE  
  Licence du projet, définissant les droits d’utilisation.

- README.md  
  Documentation principale du projet, point d’entrée pour les contributeurs.
```

---

### 🧠 Synthèse générale

Le projet github_IA‑inference est conçu comme une plateforme d’expérimentation et d’automatisation autour de l’inférence IA dans GitHub.  
Il combine :

- 》》 une gouvernance GitHub complète (issues, PR, workflows)  
- 》》 un système de prompts IA modulaire  
- 》》 des artefacts générés automatiquement  
- 》》 une documentation technique structurée  

###### L’ensemble forme un environnement professionnel, propre et extensible, idéal pour tester, développer et automatiser des pipelines IA dans un dépôt GitHub.

---
