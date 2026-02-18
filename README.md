TP Terraform & Ansible – Niveau 1

Objectif

L’objectif de ce projet est d’automatiser le déploiement et la configuration d’une infrastructure simple composée de deux machines virtuelles Linux. La première machine assure le rôle de serveur web, tandis que la seconde assure le rôle de serveur de base de données. Le déploiement de l’infrastructure est réalisé avec Terraform et la configuration logicielle des machines est effectuée avec Ansible.

Outils
	•	Terraform : utilisé pour le provisionnement de l’infrastructure, notamment la création des machines virtuelles sur une plateforme de virtualisation VMware vSphere à partir d’un template Ubuntu Server.
	•	Ansible : utilisé pour la configuration des machines virtuelles, la création des utilisateurs et l’installation des services nécessaires.
	•	Git / GitHub : utilisé pour le versionnement du code et le suivi des modifications du projet.

Architecture

L’infrastructure déployée est composée de deux machines virtuelles :
	•	Une machine virtuelle web, sur laquelle est installé et configuré le service Nginx.
	•	Une machine virtuelle base de données, sur laquelle est installé et configuré le service MariaDB.

Les deux machines sont déployées sur le même réseau et utilisent un template commun afin de garantir une configuration cohérente.

Workflow

Dans un premier temps, Terraform est utilisé pour créer automatiquement les deux machines virtuelles et préparer l’infrastructure. Une fois les machines disponibles, Ansible est utilisé pour se connecter aux hôtes, créer l’utilisateur de déploiement et installer les services nécessaires. Les playbooks Ansible sont idempotents, ce qui permet de relancer la configuration sans modifier l’état final des machines.