/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select * from animals where date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';
select * from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
END;

BEGIN;
delete from animals;
ROLLBACK;
select * from animals;

BEGIN;
SAVEPOINT delete_point;
delete from animals where date_of_birth > '2022-1-1';
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_point;
RELEASE SAVEPOINT delete_point;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
END;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select AVG(weight_kg) from animals;
select MAX(escape_attempts) from animals;
select species, MIN(weight_kg) as minimum, MAX(weight_kg) as maximum from animals GROUP BY species;
select species, AVG(escape_attempts) from animals where date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;