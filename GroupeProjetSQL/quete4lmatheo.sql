-- Requête 4.1 : Nombre total de véhicules
SELECT COUNT(*) AS nombre_total_vehicules
FROM vehicule;

-- Requête 4.2 : Nombre de véhicules par ville
SELECT
    ville,
    COUNT(*) AS nombre_vehicules
FROM vehicule
GROUP BY ville
ORDER BY nombre_vehicules DESC;

-- Requête 4.3 : Autonomie moyenne des véhicules
SELECT ROUND(AVG(autonomie_km), 2) AS autonomie_moyenne_km
FROM vehicule;

-- Requête 4.4 : Nombre de locations effectuées par client
SELECT
    c.nom,
    c.prenom,
    COUNT(l.id_location) AS nombre_locations
FROM client c
JOIN location l ON c.id_client = l.id_client
GROUP BY c.id_client, c.nom, c.prenom
ORDER BY nombre_locations DESC;
