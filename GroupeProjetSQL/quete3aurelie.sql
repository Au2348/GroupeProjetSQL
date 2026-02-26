-- QUETE 3, jointures, (qui,quelle voiture/date_debut(delocation),trajet dep/arr)

-- Requête 1 : Afficher la date de début de chaque location, ainsi que le nom et prénom du client associé.
SELECT l.date_debut, c.nom, c.prenom
FROM location
JOIN client ON l.id_client = c.id_client;

-- Requête 2 : Afficher la date de début de chaque location, ainsi que la marque et le modèle du véhicule associé.
SELECT location.date_debut, v.marque, v.modele
FROM location
JOIN vehicule ON l.id_vehicule = v.id_vehicule;

-- Requête 3 : Afficher la date de début de chaque location, ainsi que le nom de la station de départ et d'arrivée.
-- joindre la table station 2 fois,1.depart,2.arrivee
SELECT l.id_location, dep.nom AS depart, arr.nom AS arrivee
FROM location
JOIN station AS dep ON l.id_station_depart = dep.id_station
JOIN station AS arr ON l.id_station_arrivee = arr.id_station;
