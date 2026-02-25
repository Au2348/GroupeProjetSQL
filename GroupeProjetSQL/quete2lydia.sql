SELECT * 
FROM vehicules
ORDER BY autonomie_km DESC;

SELECT * 
FROM vehicules
WHERE etat = 'disponible'
ORDER BY ville ASC, marque ASC;

SELECT * 
FROM client
ORDER BY nom ASC, prenom ASC;