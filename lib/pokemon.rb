class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name,type,db)
    sql =<<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql =<<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL

    pokemons = db.execute(sql, id).flatten
    self.new(id: pokemons[0], name: pokemons[1], type: pokemons[2], db: db)
  end



end
