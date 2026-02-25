////////////////////Projet SQL : Gestion de flotte - clAra Mobility///////////////////////

1🚘. Contexte du projet**************************************
Ce projet a été réalisé dans le cadre de notre formation en Data & IA (Niveau B1). Nous nous sommes placés dans le rôle de techniciens data juniors au sein de l'entreprise fictive cIAra Mobility, spécialisée dans la location de véhicules électriques partagés (voitures, scooters, trottinettes et vélos).

Notre mission consistait à interroger une base de données existante pour répondre à des besoins métier concrets, allant de la simple extraction de données à l'analyse de la performance de la flotte.

2🚕. Membres du GROUPE****************************************

Lydia: réalisation de la quête 1 et 2 et de la diapositive. 

Aurélie: réalisation de la quête 3 et du READ ME.

Mathéo : Responsable du groupe et de la répartition des tâches, réalisation de la Quêtes 4 & 5.


3🏎️. Technologies utilisées***********************************

SGBD : PostgreSQL 
Langage : SQL 
Outils : pgAdmin 4 / Visual Studio Code
Versionning : Git & GitHub

4.🚔 Structure du dépôt***************************************
Le projet est organisé par "quêtes" correspondant aux différentes étapes de complexité :

quete1 : Découverte et sélections simples.

quete2 : Tris et filtres avancés.

quete3 : Utilisation des jointures (JOIN).

quete4 : Fonctions d'agrégation (COUNT, AVG).

quete5 : Cas métier complexes (HAVING, sous-requêtes).

vehicules_cIAra_2025.csv : Jeu de données brut (pour référence).





⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️Rapport d'Analyse Technique⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️

A. Organisation du travail 

🧑‍🔧Méthodologie :
->Nous avons travaillé de manière hybride. Au début, nous avons réparti les premières quêtes pour avancer efficacement : Lydia s'est concentrée sur la découverte et les filtres (Quêtes 1 & 2) tandis que je préparais la structure des jointures (Quête 3). Les quêtes 4 et 5 ont été réalisées par Mathéo. 

Gestion de version (Git) :
Nous avons utilisé un dépôt GitHub commun. Chaque membre a travaillé sur sa machine locale. Nous avons effectué des commits réguliers à la fin de chaque quête réussie pour assurer la sauvegarde du travail.




B. Analyse du Modèle de Données (MCD) 

🛠️La base de données de cIAra Mobility est structurée autour de 4 tables principales relationnelles:


-vehicule : Contient le parc automobile (id, marque, modèle, autonomie, état).

-client : Contient les informations des utilisateurs (id, nom, prénom, email).

-station : Répertorie les lieux de stationnement (id, nom, ville).

-location : C'est la table centrale (table de faits). Elle relie les trois autres tables grâce à des clés étrangères (id_client, id_vehicule, id_station_depart, id_station_arrivee).

⛽Pertinence du modèle :
Cette structure est pertinente car elle évite la redondance des données. Par exemple, si un véhicule change d'état, on le modifie une seule fois dans la table vehicule, et l'information est à jour pour toutes les futures locations. Elle permet de suivre précisément le trajet d'un véhicule (départ vs arrivée).





C. Choix Techniques et Syntaxe SQL 

🛣️Pour répondre aux besoins métier, nous avons adopté une stratégie de complexité croissante :

Filtrage des données (Quêtes 1 & 2) :
Nous avons utilisé WHERE pour isoler les véhicules "Disponibles" ou ceux ayant une "autonomie > 400 km". Pour les tris, ORDER BY nous a permis de classer les résultats (ex: par autonomie décroissante).


Reconstitution des informations (Quête 3) :
Les tables étant séparées, nous avons utilisé INNER JOIN pour afficher le "Nom du client" plutôt que son "ID".


Exemple : FROM location INNER JOIN client ON location.id_client = client.id_client.

Analyses statistiques (Quête 4 - Agrégations) :
Pour obtenir des chiffres clés (KPIs), nous avons utilisé les fonctions d'agrégation couplées à GROUP BY.


COUNT(*) : Pour compter le nombre total de locations par client.


AVG(autonomie) : Pour calculer l'autonomie moyenne de la flotte.

Cas métier complexes (Quête 5) :

Filtrage post-agrégation : Pour afficher les "clients ayant effectué au moins 2 locations", nous ne pouvions pas utiliser WHERE. Nous avons donc utilisé HAVING COUNT(*) >= 2 après le GROUP BY.

Données manquantes : Pour trouver les "véhicules n'ayant jamais été loués", nous avons choisi un LEFT JOIN entre vehicule et location, en filtrant sur les lignes où l'ID de location est NULL




D. Difficultés rencontrées et Solutions 
🔧 Respecter l'ordre des blocs SQL
🔧Problème : Au début, nous avions souvent des erreurs de syntaxe car nous ne mettions pas les instructions dans le bon ordre (par exemple, on mettait le ORDER BY avant le WHERE).

->Solution : Nous avons dû mémoriser la structure stricte d'une requête : d'abord on sélectionne (SELECT), ensuite on filtre (WHERE), et seulement à la toute fin, on trie les résultats (ORDER BY).

🔧Erreur de "colonne ambiguë"
🔧Problème : Lors des jointures (Quête 3), nous avons voulu afficher l'ID du client, mais le logiciel nous a renvoyé une erreur "Ambiguous column". C'est parce que la colonne id_client existe à la fois dans la table client et dans la table location.

->Solution : Nous avons appris qu'il faut toujours préciser le nom de la table devant la colonne en cas de doublon (ex : écrire client.id_client au lieu de juste id_client).


🔧Erreur "Column must appear in the GROUP BY clause" :
🔧Problème : Lors de la Quête 4, nous avons essayé de sélectionner le nom du client et le COUNT(*) sans grouper par le nom.

->Solution : Nous avons appris que toute colonne non agrégée dans le SELECT doit obligatoirement figurer dans le GROUP BY.


🔑🔑🔑🔑🔑🔑🔑🔑🔑 Conclusion🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑

 Au-delà du code, ce projet nous a appris à réfléchir comme des professionnels. Analyser la performance de la flotte nous a forcés à être précis et organisés. Même si certaines requêtes nous ont donné du fil à retordre, le sentiment d'avoir réussi à "faire parler les données" est super motivant pour nos futurs projets.
