require 'pry'

class Pokemon
  attr_accessor :name, :type, :db 
  attr_reader :id 

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type 
    @db = db   
  end 

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end  

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
      SQL

      new_pokemon = db.execute(sql, id).flatten
      self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end 
end
