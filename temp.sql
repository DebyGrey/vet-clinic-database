/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg.
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with weights that equal precisely 10.4kg or 17.3kg).
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
COMMIT;

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
BEGIN;
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

-- Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Inside a transaction delete all animals born after Jan 1st, 2022, then create a savepoint and update their weights:
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint and update the weights again for animals with negative weights:
ROLLBACK TO SP1;

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

-- Commit transaction:
COMMIT;

-- Verify if all records in the animals table still exist after the rollback:
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