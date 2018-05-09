require_relative('../db/SqlRunner')
require_relative('./Animal')

class Customer
  attr_reader :id, :name, :email, :approved_to_adopt

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @email = options["email"]
    @approved_to_adopt = options["approved_to_adopt"]=='t' || options["approved_to_adopt"]=='on'
  end

  def save()
    @approved_to_adopt = @approved_to_adopt==true ? 't' : 'f'
    sql = "INSERT INTO customers (name, email) VALUES ($1, $2) RETURNING id;"
    values = [@name, @email]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    @approved_to_adopt = @approved_to_adopt==true ? 't' : 'f'
    sql = "UPDATE customers SET (name, email, approved_to_adopt)
      = ($1, $2, $3) WHERE ID = $4;"
    values = [@name, @email, @approved_to_adopt, @id]
    SqlRunner.run(sql, values)
  end

  def animals()
    sql = "SELECT animals.* FROM adoptions
    INNER JOIN animals 
      ON animals.id = adoptions.animal_id
    WHERE adoptions.customer_id = $1"
    animals = SqlRunner.run(sql, [@id])
    Animal.map_items(animals)
  end

  # Class methods
  def self.by_id(id)
    sql = "SELECT * FROM customers WHERE id = $1;"

    customer = SqlRunner.run(sql, [id]).first()
    self.new(customer)
  end

  def self.all()
    customers = SqlRunner.run("SELECT * FROM customers;")
    self.map_items(customers)
  end

  def self.approved()
    customers = SqlRunner.run("SELECT * FROM customers WHERE approved_to_adopt = 't';")
    self.map_items(customers)
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM customers;")
  end

  def self.map_items(items)
    return items.map { |item| self.new(item) }
  end
end