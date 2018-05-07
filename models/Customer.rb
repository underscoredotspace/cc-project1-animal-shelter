require_relative('../db/SqlRunner')

class Customer
  attr_reader :id, :name, :email

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @email = options["email"]
  end

  def save()
    sql = "INSERT INTO customers (name, email) VALUES ($1, $2) RETURNING id;"
    values = [@name, @email]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end
end