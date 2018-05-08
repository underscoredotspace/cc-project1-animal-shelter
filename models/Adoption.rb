require_relative('../db/SqlRunner')

class Adoption
  attr_reader(:adoption_date,
    :customer_id, :customer_name, :customer_email, 
    :animal_id, :animal_name, :animal_type, :animal_breed)
  def initialize(options)
    @adoption_date = options["adoption_date"]
    @customer_id = options["customer_id"].to_i
    @customer_name = options["customer_name"]
    @customer_email = options["email"]
    @animal_id = options["animal_id"].to_i
    @animal_name = options["animal_name"]
    @animal_breed = options["breed"]
    @animal_type = options["type"]

  end

  def save()
    sql = "INSERT INTO adoptions (customer_id, animal_id, adoption_date)
      VALUES ($1, $2, CURRENT_DATE) RETURNING id;"
    values = [@customer_id, @animal_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  # Class methods
  def self.adoptions()
    sql = 'SELECT adoptions.*, 
      animals.name AS animal_name, breed, type, 
      customers.name AS customer_name, email FROM animals 
    INNER JOIN adoptions 
      ON animals.id = animal_id 
    INNER JOIN customers
      ON customers.id = customer_id
    INNER JOIN animal_breeds
      ON breed_id = animal_breeds.id
    INNER JOIN animal_types
      ON type_id = animal_types.id'
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.find_by_animal_id(id)

  end

  def self.find_by_customer_id(id)

  end

  def self.map_items(items)
    return items.map { |item| self.new(item) }
  end
end