/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
COMMIT;

BEGIN;
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;

-- Other queries for verification:
SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT COUNT(name) FROM animals
WHERE neutered = false;

SELECT COUNT(name) FROM animals
WHERE neutered = true;

SELECT MIN(weight_kg) FROM animals
GROUP BY species;
SELECT MAX(weight_kg) FROM animals
GROUP BY species;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id
WHERE species_id = 1;

SELECT animals.name, full_name 
FROM owners 
LEFT JOIN animals ON animals.owner_id = owners.id; 

SELECT species.name, COUNT(*)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id = owners.id
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;


SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 4 ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT (DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2;

SELECT vets.name, species.name
FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON specializations.species_id = species.id;

SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.id = 2
AND visits.date_of_visit >= '2020-01-04' AND visits.date_of_visit <= '2020-08-30';

SELECT animals.name, COUNT(visits.animals_id) AS visit_count
FROM visits
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT animals.name 
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets on vets.id = visits.vets_id
WHERE vets.id = 1
ORDER BY visits.date_of_visit
LIMIT 1;

SELECT animals.*, vets.*, visits.date_of_visit
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*)
FROM visits
JOIN vets ON vets.id = visits.vets_id
WHERE vets.id = 1;

SELECT species.name, COUNT(visits.animals_id)
FROM visits
JOIN vets ON visits.vets_id = vets.id
FULL JOIN animals ON visits.animals_id = animals.id
JOIN species ON species.id = animals.species_id
WHERE vets.id = 1
GROUP BY species.name
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;
