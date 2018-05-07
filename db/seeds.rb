require_relative('./SqlRunner')
require_relative('../models/Animal')

SqlRunner.run('DELETE FROM animal_types')

dog = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Dog') RETURNING id;")[0]['id']
cat = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Cat') RETURNING id;")[0]['id']

cat_dsh = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Domestic Shorthair', $1) RETURNING id;", [cat])[0]['id']
dog_poodle = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Poodle', $1) RETURNING id;", [dog])[0]['id']
dog_springer = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Springer Spaniel', $1) RETURNING id;", [dog])[0]['id']

animal_new = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'New'")[0]["id"]
animal_available = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'Available'")[0]["id"]
animal_adopted = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'Adopted'")[0]["id"]

Animal.delete_all()

animal1 = Animal.new({
  "name" => "Ben",
  "breed_id" => dog_poodle,
  "status_id" => animal_available,
  "admission_date" => "2018-02-28"
})

animal1.save()

animal2 = Animal.new({
  "name" => "Neeko",
  "breed_id" => cat_dsh,
  "status_id" => animal_new,
  "admission_date" => "2017-09-01"
})

animal2.save()