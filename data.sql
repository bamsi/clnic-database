/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-2-3',0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15',2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-1-7',1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12',5, true, 11);


INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-8',0, false, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15',2, true, 5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-4-2',3, false, 12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-6-12',1, true, 45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-6-7',7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13',3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-5-14',4, true, 22);

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 24);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 44);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

UPDATE animals SET species_id = 2 WHERE name like '%mon';
UPDATE animals SET species_id = 1 WHERE name not like '%mon';

UPDATE animals SET owner_id = 1 where name = 'Agumon';
UPDATE animals SET owner_id = 2 where name = 'Gabumon' or name='Pikachu';
UPDATE animals SET owner_id = 3 where name = 'Devimon' or name='Plantmon';
UPDATE animals SET owner_id = 4 where name = 'Charmander' or name='Squirtle' or name='Blossom';
UPDATE animals SET owner_id = 5 where name = 'Angemon' or name='Boarmon';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-4-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-1-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-5-4');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-6-8');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (17, 1, '2020-5-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (17, 3, '2020-7-22');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (18, 4, '2021-2-2');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (19, 2, '2020-1-5');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (19, 2, '2020-3-8');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (19, 2, '2020-5-14');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (20, 3, '2021-5-4');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (21, 4, '2021-2-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (22, 2, '2019-12-21');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (22, 1, '2020-8-10');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (22, 2, '2021-4-7');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (23, 3, '2019-9-29');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (24, 4, '2020-10-3');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (24, 4, '2020-11-4');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2019-1-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2019-5-15');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2020-2-27');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2020-8-3');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2020-5-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (25, 2, '2021-1-11');

--Run the following statements to add data to your database (executing them might take a few minutes):
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';