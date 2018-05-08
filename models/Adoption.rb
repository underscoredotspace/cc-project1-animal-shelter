require_relative('../db/SqlRunner')

class Adoption
  def initialize(options)
    @customer_id = options["customer_id"].to_i
    @animal_id = options["animal_id"].to_i
    @adoption_date = options["adoption_date"]
  end

  def save()
    sql = "INSERT INTO adoptions (customer_id, animal_id, adoption_date)
      VALUES ($1, $2, CURRENT_DATE) RETURNING id;"
    values = [@customer_id, @animal_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end
end