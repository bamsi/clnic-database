/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select * from animals where date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
select * from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;