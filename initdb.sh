#!/bin/sh

echo "Dropping database (if it exists)..."
dropdb animal_shelter

echo "Creating database..."
createdb animal_shelter

echo "Creating tables and default data..."
psql -d animal_shelter -f ./db/animal_shelter.sql

echo "Inserting dummy data..."
ruby ./db/seeds.rb

echo "Done!"