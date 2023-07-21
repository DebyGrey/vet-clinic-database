/* Populate the database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-01-07', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);

/* New data */

INSERT INTO owners(full_name, age)VALUES('Sam Smith', 34);

INSERT INTO owners(full_name, age)VALUES('Jennifer Orwell', 19);

INSERT INTO owners(full_name, age)VALUES('Bob', 45);

INSERT INTO owners(full_name, age)VALUES('Melody Pond', 77);

INSERT INTO owners(full_name, age)VALUES('Dean Winchester', 14);

INSERT INTO owners(full_name, age)VALUES('Jodie Whittaker', 38);

INSERT INTO species(name)VALUES('Pokemon');

INSERT INTO species(name)VALUES('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') 
WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jenifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)VALUES ('Maisy Smith', 26, '2029-01-17');

INSERT INTO vets (name, age, date_of_graduation)VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id, species_id)VALUES (4, 1);

INSERT INTO specializations (vets_id, species_id)VALUES (2, 1);

INSERT INTO specializations (vets_id, species_id)VALUES (2, 2);

INSERT INTO specializations (vets_id, species_id)VALUES (3, 2);

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 1, '2020-05-24');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 2, '2020-07-22');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (3, 2, '2021-02-02');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 4, '2020-01-05');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 1, '2020-03-08');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 1, '2020-05-14');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (2, 3, '2021-05-04');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (3, 5, '2021-02-24');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 6, '2019-12-21');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 6, '2020-08-10');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 6, '2021-04-07');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (2, 7, '2019-09-29');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (3, 8, '2020-10-03');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (3, 8, '2020-11-04');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 9, '2019-01-24');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 9, '2019-05-15');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 9, '2020-02-27');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (1, 9, '2020-08-03');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (2, 10, '2020-05-24');

INSERT INTO visits (vets_id, animals_id, date_of_visit)VALUES (4, 10, '2021-01-11');