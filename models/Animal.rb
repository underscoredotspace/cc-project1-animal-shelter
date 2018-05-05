require_relative('../db/SqlRunner')

class Animal
  attr_reader :id
  attr_accessor :name, :breed_id, :status_id, :admission_date

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
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
end