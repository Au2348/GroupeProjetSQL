-- Requête 5.1 : Top 3 des véhicules disponibles les plus autonomes
SELECT
    id_vehicule,
    marque,
    modele,
    autonomie_km,
    ville
FROM vehicule
WHERE etat = 'Disponible'
ORDER BY autonomie_km DESC
LIMIT 3;

-- Requête 5.2 : Ville avec le plus grand nombre de véhicules disponibles
SELECT
    ville,
    COUNT(*) AS nb_vehicules_disponibles
FROM vehicule
WHERE etat = 'Disponible'
GROUP BY ville
ORDER BY nb_vehicules_disponibles DESC
LIMIT 1;

-- Requête 5.3 : Clients avec au moins 2 locations
SELECT
    c.nom,
    c.prenom,
    COUNT(l.id_location) AS nombre_locations
FROM client c
JOIN location l ON c.id_client = l.id_client
GROUP BY c.id_client, c.nom, c.prenom
HAVING COUNT(l.id_location) >= 2
ORDER BY nombre_locations DESC;

-- Requête 5.4 : Véhicules jamais loués
SELECT
    v.id_vehicule,
    v.marque,
    v.modele,
    v.ville
FROM vehicule v
LEFT JOIN location l ON v.id_vehicule = l.id_vehicule
WHERE l.id_location IS NULL;

