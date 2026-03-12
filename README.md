# TP Terraform & Ansible – Niveau 1

## Objectif

L'objectif de ce projet est d'automatiser le déploiement et la configuration d'une infrastructure simple composée de deux machines virtuelles Linux.
La première machine assure le rôle de serveur web, tandis que la seconde assure le rôle de serveur de base de données.

Le déploiement de l'infrastructure est réalisé avec Terraform et la configuration logicielle des machines est effectuée avec Ansible.

⸻

## Outils utilisés

### Terraform

Terraform est utilisé pour le provisionnement de l'infrastructure, notamment la création des machines virtuelles sur une plateforme de virtualisation VMware vSphere à partir d'un template Ubuntu Server.

### Ansible

Ansible est utilisé pour la configuration des machines virtuelles, la création des utilisateurs et l'installation des services nécessaires.

### Git / GitHub

Git et GitHub sont utilisés pour le versionnement du code et le suivi des modifications du projet.

⸻

## Architecture

L'infrastructure déployée est composée de deux machines virtuelles :
• Une machine virtuelle web, sur laquelle est installé et configuré le service Nginx
• Une machine virtuelle base de données, sur laquelle est installé et configuré le service MariaDB

Les deux machines sont déployées sur le même réseau et utilisent un template commun afin de garantir une configuration cohérente.

⸻

## Workflow

Dans un premier temps, Terraform est utilisé pour créer automatiquement les deux machines virtuelles et préparer l'infrastructure.
Une fois les machines disponibles, Ansible est utilisé pour se connecter aux hôtes, créer l'utilisateur de déploiement et installer les services nécessaires.

Les playbooks Ansible sont idempotents, ce qui permet de relancer la configuration sans modifier l'état final des machines.

⸻

## Démonstration

### Étape 1 – Déploiement de l'infrastructure avec Terraform

On commence par lancer terraform apply pour créer les deux machines virtuelles sur vSphere à partir du template Ubuntu.
Après environ 2 minutes, Terraform confirme la création des deux VMs et affiche leurs adresses IP assignées.

<img width="1524" height="844" alt="image" src="https://github.com/user-attachments/assets/d59b5517-4399-433b-b419-01fa769ed446" />


### Étape 2 – Vérification dans vSphere Client

Une fois le déploiement terminé, on vérifie la présence des VMs directement dans le vSphere Client.
Les machines vm-db et vm-web apparaissent bien dans l'inventaire de l'hôte ESXi aux côtés des machines existantes.

<img width="1798" height="1194" alt="image" src="https://github.com/user-attachments/assets/3c6177ee-bdf3-4936-b025-b9a8720c3d0c" />

### Étape 3 – Test de connectivité avec Ansible

Avant de lancer le playbook, on vérifie qu'Ansible peut joindre les deux hôtes en utilisant le module ping.
Les hôtes web1 et db1 répondent tous les deux avec succès.

<img width="2158" height="678" alt="image" src="https://github.com/user-attachments/assets/61b1fa10-4215-44b7-8ce1-64b1d1b9f847" />


### Étape 4 – Configuration des VMs avec Ansible

On lance ensuite le playbook principal qui se charge de créer l'utilisateur de déploiement sur les deux machines, d'installer et de démarrer Nginx sur le serveur web, et d'installer et de démarrer MariaDB sur le serveur de base de données.
Le PLAY RECAP final confirme que toutes les tâches se sont exécutées sans erreur sur les deux hôtes.

<img width="2184" height="1544" alt="image" src="https://github.com/user-attachments/assets/fad10b80-2c54-4104-9ff3-1e8604f80c8b" />


### Étape 5 – Destruction de l'infrastructure

Pour nettoyer l'environnement après les tests, on utilise terraform destroy.
Les deux machines virtuelles sont supprimées proprement en quelques secondes.

<img width="1400" height="838" alt="image" src="https://github.com/user-attachments/assets/3b3930c0-54d6-4d9c-8fe2-3543f03df0b4" />

