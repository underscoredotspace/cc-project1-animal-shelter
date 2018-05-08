require_relative('../db/SqlRunner')

class Animal
  attr_reader :id, :type, :breed, :adoptable, :type_id, :name, :breed_id, :admission_date

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @type_id = options["type_id"].to_i
    @breed_id = options["breed_id"].to_i
    @adoptable =  options["adoptable"]=='t' || options["adoptable"]=='on'
    @admission_date = options["admission_date"]
  end

  def save()
    @adoptable = @adoptable==true ? 't' : 'f'
    sql = "INSERT INTO animals (name, breed_id, adoptable, admission_date)
      VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @breed_id, @adoptable, @admission_date]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    @adoptable = @adoptable==true ? 't' : 'f'
    sql = "UPDATE animals SET (name, breed_id, adoptable, admission_date)
      = ($1, $2, $3, $4) WHERE ID = $5;"
    values = [@name, @breed_id, @adoptable, @admission_date, @id]
    SqlRunner.run(sql, values)
  end

  # Class methods
  def self.by_id(id)
    sql = "SELECT animals.*, type_id, type, breed, adoptable FROM animals
    INNER JOIN animal_breeds
      ON breed_id = animal_breeds.id
    INNER JOIN animal_types
      ON type_id = animal_types.id
    WHERE animals.id = $1
    ORDER BY animals.admission_date;"

    animal = SqlRunner.run(sql, [id]).first()
    Animal.new(animal)
  end
  
  def self.all()
    sql = "SELECT * FROM animals 
    FULL JOIN adoptions 
      ON animals.id = animal_id 
    INNER JOIN animal_breeds
      ON breed_id = animal_breeds.id
    INNER JOIN animal_types
      ON type_id = animal_types.id
    WHERE adoption_date IS NULL;"
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.adoptable()
    sql = "SELECT animals.*, type_id, type, breed FROM animals 
    FULL JOIN adoptions 
      ON animals.id = animal_id 
    INNER JOIN animal_breeds
      ON breed_id = animal_breeds.id
    INNER JOIN animal_types
      ON type_id = animal_types.id
    WHERE adoption_date IS NULL AND animals.adoptable = 't';"
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.new_animals()
    sql = "SELECT animals.*, type, breed, adoptable FROM animals
      INNER JOIN animal_breeds
        ON breed_id = animal_breeds.id
      INNER JOIN animal_types
        ON type_id = animal_types.id
      WHERE adoptable = 'f'
      ORDER BY animals.admission_date;"
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM animals;')
  end

  def self.breeds(type_id)
    sql = "SELECT animal_breeds.* FROM animal_breeds
      INNER JOIN animal_types
        ON type_id = animal_types.id
      WHERE type_id = $1;"
    values = [type_id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(items)
    return items.map { |item| self.new(item) }
  end
end