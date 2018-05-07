require_relative('../db/SqlRunner')

class Animal
  attr_reader :id, :type, :breed, :status
  attr_accessor :name, :breed_id, :status_id, :admission_date

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @status = options["status"]
    @breed_id = options["breed_id"]
    @status_id = options["status_id"]
    @admission_date = options["admission_date"]
  end

  def save()
    sql = "INSERT INTO animals (name, breed_id, status_id, admission_date)
      VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @breed_id, @status_id, @admission_date]
    @id = SqlRunner.run(sql, values)[0]["id"]
  end

  # Class methods
  def self.all()
    sql = "SELECT animals.*, type, breed, status FROM animals
      INNER JOIN animal_breeds
        ON breed_id = animal_breeds.id
      INNER JOIN animal_types
        ON type_id = animal_types.id
      INNER JOIN animal_statuses
      ON status_id = animal_statuses.id
      ORDER BY animals.admission_date;"
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.adoptable()
    sql = "SELECT animals.*, type, breed, status FROM animals
      INNER JOIN animal_breeds
        ON breed_id = animal_breeds.id
      INNER JOIN animal_types
        ON type_id = animal_types.id
      INNER JOIN animal_statuses
      ON status_id = animal_statuses.id
      WHERE status = 'Available'
      ORDER BY animals.admission_date;"
    results = SqlRunner.run(sql)
    self.map_items(results)
  end

  def self.map_items(items)
    return items.map { |item| self.new(item) }
  end
end