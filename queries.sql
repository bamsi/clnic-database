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

select a.name from animals as a join owners as o on a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
select a.name from animals as a join species as s on a.species_id = s.id WHERE s.name = 'Pokemon';
select o.full_name as owner, a.name as animal from owners as o LEFT OUTER JOIN animals as a on o.id = a.owner_id;
select s.name, count(a.*) from species as s join animals as a on a.species_id = s.id GROUP BY s.name;
select a.name from animals as a join owners as o on o.id = a.owner_id join species as s on s.id = a.species_id WHERE s.name = 'Digimon' and o.full_name='Jennifer Orwell';
select a.name from animals as a join owners as o on o.id = a.owner_id WHERE o.full_name='Dean Winchester' and a.escape_attempts = 0;
select o.full_name, count(a.*) as ntimes from owners as o join animals as a on a.owner_id = o.id GROUP BY o.full_name ORDER BY ntimes DESC limit 1; 

/** join table queries **/
select a.name from animals as a join visits as s on a.id = s.animal_id join vets as v on v.id = s.vet_id
where v.name = 'William Tatcher' ORDER BY s.visit_date DESC limit 1;

select count(a.*) from animals as a join visits as s on s.animal_id = a.id join vets as v on v.id = s.vet_id
where v.name = 'Stephanie Mendez';

select v.name as vet, sp.name as specialization from vets as v LEFT JOIN specializations as s on s.vet_id = v.id LEFT JOIN species as sp on sp.id = s.species_id; 

select a.name, s.visit_date from animals as a join visits as s on a.id = s.animal_id join vets as v on v.id = s.vet_id
where v.name = 'Stephanie Mendez' and s.visit_date BETWEEN '2020-4-1' AND '2020-8-30';

select a.name, count(s.*) as visits from animals as a join visits as s on a.id = s.animal_id GROUP BY a.name ORDER BY visits DESC limit 1;

select  a.name from animals as a join visits as s on a.id = s.animal_id join vets as v on v.id = s.vet_id
where v.name = 'Maisy Smith' ORDER BY s.visit_date ASC limit 1;

select a.*, v.name as vet, v.age as vet_age, v.date_of_graduation, s.visit_date from animals as a join visits as s on a.id = s.animal_id join vets as v on v.id = s.vet_id
ORDER BY s.visit_date DESC limit 1;

select distinct count(s.*) from visits as s join vets v on v.id = s.vet_id left join specializations as sp on sp.vet_id = v.id where sp.vet_id is null;

select distinct sc.name, count(s.*) as nvisit from visits as s join animals as a on a.id = s.animal_id join vets v on v.id = s.vet_id join species as sc on sc.id = a.species_id left join specializations as sp on sp.vet_id = v.id 
where sp.vet_id is null and v.name = 'Maisy Smith' GROUP BY sc.name ORDER BY nvisit DESC limit 1;
