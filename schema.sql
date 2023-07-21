/* Database schema to keep the structure of the entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal(10, 2)
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR (255)
);

ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE visits(
    vets_id INT,
    animals_id INT,
    date_of_visit DATE,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE
);