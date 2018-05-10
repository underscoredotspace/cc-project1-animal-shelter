require_relative('./SqlRunner')
require_relative('../models/Animal')
require_relative('../models/Customer')
require_relative('../models/Adoption')

SqlRunner.run('DELETE FROM animal_types')

dog = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Dog') RETURNING id;")[0]['id']
cat = SqlRunner.run("INSERT INTO animal_types (type) VALUES ('Cat') RETURNING id;")[0]['id']

cat_black = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Miniature Puma', $1) RETURNING id;", [cat])[0]['id']
cat_white = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Domestic Shorthair', $1) RETURNING id;", [cat])[0]['id']
dog_whippet = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Whippet', $1) RETURNING id;", [dog])[0]['id']
dog_pug = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Pug', $1) RETURNING id;", [dog])[0]['id']
dog_beagle = SqlRunner.run("INSERT INTO animal_breeds (breed, type_id) VALUES ('Beagle', $1) RETURNING id;", [dog])[0]['id']

Animal.delete_all()

animal1 = Animal.new({
  "name" => "Kira",
  "breed_id" => dog_whippet,
  "admission_date" => "2018-04-29",
  "image" => "kira.jpg"
})

animal1.save()

animal2 = Animal.new({
  "name" => "Sidney",
  "breed_id" => cat_white,
  "adoptable" => 't',
  "admission_date" => "2018-03-15",
  "image" => "sidney.jpg"
})

animal2.save()

animal3 = Animal.new({
  "name" => "Ella",
  "breed_id" => cat_white,
  "adoptable" => 't',
  "admission_date" => "2018-03-15",
  "image" => "ella.jpg"
})

animal3.save()

animal4 = Animal.new({
  "name" => "Mr Pickles",
  "breed_id" => dog_pug,
  "admission_date" => "2017-12-25",
  "image" => "winston.jpg"
})

animal4.save()

animal5 = Animal.new({
  "name" => "Neeko",
  "breed_id" => cat_black,
  "adoptable" => 't',
  "admission_date" => "2017-09-01",
  "image" => "neeko.jpg"
})

animal5.save()

animal6 = Animal.new({
  "name" => "Snoopy",
  "breed_id" => dog_beagle,
  "adoptable" => 'f',
  "admission_date" => "1950-10-02",
  "image" => "snoopy.jpg"
})

animal6.save()

Customer.delete_all()

customer1 = Customer.new({
  "name" => "Charlie Brown",
  "email" => "goodgrief@baseball.net"
})

customer1.save()

customer2 = Customer.new({
  "name" => "Drew",
  "email" => "drew@yahoo.com"
})

customer2.save()

customer3 = Customer.new({
  "name" => "Nic",
  "email" => "nicpatdaw@hotmail.co.uk"
})

customer3.save()

customer4 = Customer.new({
  "name" => "Colin",
  "email" => "ampersand@underscore.space",
  "approved_to_adopt": 't'
})

customer4.save()

colin_neeko = Adoption.new({
  "customer_id"=> customer4.id,
  "animal_id" => animal5.id
})

colin_neeko.save()