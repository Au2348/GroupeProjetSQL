SELECT location.id, client.nom, client.prenom
FROM location
JOIN client ON location.id_client = client.id;

SELECT location.id, vehicule.marque, vehicule.modele
FROM location
JOIN vehicule ON location.id_vehicule = vehicule.id;

SELECT location.id, dep.nom AS depart, arr.nom AS arrivee
FROM location
JOIN station AS dep ON location.id_station_depart = dep.id
JOIN station AS arr ON location.id_station_arrivee = arr.id;