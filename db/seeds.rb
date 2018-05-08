require_relative('./SqlRunner')
require_relative('../models/Animal')
require_relative('../models/Customer')

SqlRunner.run('DELETE FROM animal_types')

dog = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Dog') RETURNING id;")[0]['id']
cat = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Cat') RETURNING id;")[0]['id']

cat_black = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Miniature Puma', $1) RETURNING id;", [cat])[0]['id']
cat_white = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Domestic Shorthair', $1) RETURNING id;", [cat])[0]['id']
dog_whippet = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Whippet', $1) RETURNING id;", [dog])[0]['id']
dog_pug = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Pug', $1) RETURNING id;", [dog])[0]['id']

animal_new = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'New'")[0]["id"]
animal_available = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'Available'")[0]["id"]
animal_adopted = SqlRunner.run("SELECT id FROM animal_statuses WHERE status = 'Adopted'")[0]["id"]

Animal.delete_all()

animal1 = Animal.new({
  "name" => "Kira",
  "breed_id" => dog_whippet,
  "status_id" => animal_new,
  "admission_date" => "2018-04-29"
})

animal1.save()

animal2 = Animal.new({
  "name" => "Sidney",
  "breed_id" => cat_white,
  "status_id" => animal_available,
  "admission_date" => "2018-03-15"
})

animal2.save()

animal3 = Animal.new({
  "name" => "Ella",
  "breed_id" => cat_white,
  "status_id" => animal_available,
  "admission_date" => "2018-03-15"
})

animal3.save()

animal4 = Animal.new({
  "name" => "Mr Pickles",
  "breed_id" => dog_pug,
  "status_id" => animal_new,
  "admission_date" => "2017-12-25"
})

animal4.save()

animal5 = Animal.new({
  "name" => "Neeko",
  "breed_id" => cat_black,
  "status_id" => animal_adopted,
  "admission_date" => "2017-09-01"
})

animal5.save()

Customer.delete_all()

customer1 = Customer.new({
  "name" => "Amy",
  "email" => "amy@gmail.com"
})

customer1.save()

customer2 = Customer.new({
  "name" => "Drew",
  "email" => "drew@yahoo.com"
})

customer2.save()

customer3 = Customer.new({
  "name" => "Nic",
  "email" => "nicpatdaw@hotmail.co.uk",
  "approved_to_adopt": true
})

customer3.save()