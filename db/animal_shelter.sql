DROP TABLE IF EXISTS animal_types;
DROP TABLE IF EXISTS animal_breeds;
DROP TABLE IF EXISTS animal_statuses;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS adoptions;

CREATE TABLE animal_types (
  id serial PRIMARY KEY,
  type varchar(255) UNIQUE
);

CREATE TABLE animal_breeds (
  id serial PRIMARY KEY,
  breed varchar(255) UNIQUE,
  type_id integer REFERENCES animal_types (id) ON DELETE CASCADE
);

CREATE TABLE animal_statuses (
  id serial PRIMARY KEY,
  status varchar(255) UNIQUE
);

INSERT INTO animal_statuses (status) VALUES ('New'),('Available'),('Adopted');

CREATE TABLE animals (
  id serial PRIMARY KEY,
  name varchar(255),
  admission_date date,
  breed_id integer REFERENCES animal_breeds (id) ON DELETE CASCADE,
  status_id integer REFERENCES animal_statuses (id) ON DELETE CASCADE
);

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name varchar(255),
  email varchar(255) UNIQUE,
  approved_to_adopt boolean DEFAULT false
);

CREATE TABLE adoptions (
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers (id) ON DELETE CASCADE,
  animal_id integer REFERENCES animals (id) ON DELETE CASCADE
);