class Pokemon
  attr_reader :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL

    db.execute(sql, id).map{|pokemon_data| self.new(name: pokemon_data[1], type: pokemon_data[2], id: pokemon_data[0], db: db)}[0]
  end
end
