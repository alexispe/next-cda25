
1.
- Installer git, node 24 sur le serveur
- Récupérer le code sur le serveur
- Réussir à accéder à http://IP_DU_SERVEUR:3000 pour voir le site web

```sh
sudo apt update
sudo apt upgrade
sudo apt install git


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
node -v # Should print "v24.15.0".
npm -v # Should print "11.12.1".

git clone https://github.com/alexispe/next-cda25.git
cd next-cda25
npm install
npm run build
npm run start
```

2.
- Installer pm2 et démarrer le process node via pm2

```sh
npm install pm2@latest -g
pm2 start npm --name "next-app" -- run start
pm2 list
pm2 restart next-app
```

3.
- Créer un nouveau job de deploy
  - Il se connecte en SSH sur le serveur
    - Utiliser les secrets GitHub (`SSH_KEY`, `SSH_USER`, `SSH_HOST`)
    - Commencer par faire un `ls`
  - Il fait les commandes nécessaires à la mise à jour du site

4.
- Créer les branches git (main, develop)

- Le déploiement en production 
    (celui actuel, ne se déclenche qu'au push d'un tag)

- Le déploiement en recette se fait à chaque push sur develop.
  - Implique la création d'un nouveau dossier sur le serveur (production et recette)

Prod sur port 3000
Recette sur port 3001

- Remettre au propre les dépendances entre nos jobs
  pour créer la pipeline finale


5.
- Suivre le "TP Docker" envoyé sur Discord
- **En local** : 
  - Créer un Dockerfile et un compose.prod.yml pour lancer l'application en mode prod
  - Créer un compose.yml utilisant cette même image pour la lancer en mode dev

  - Supprimer le node_modules, lancer la stack de dev, est-ce que ça marche ?
  - La stack de dev est lancée, modifiez le code du site, est-ce que le hot reload fonctionne ?





