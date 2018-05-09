require('pg')

class SqlRunner
  def self.connect()
    uri = URI.parse(ENV['DATABASE_URL'])
    postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)

    # PG.connect({
    #   dbname: 'animal_shelter', 
    #   host: 'localhost'
    # })
  end

  def self.run(sql, values=[])
    begin
      db = self.connect()
      result = db.exec_params(sql, values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
