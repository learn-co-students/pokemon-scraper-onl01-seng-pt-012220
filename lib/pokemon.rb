class Pokemon
  attr_accessor :id, :name, :type, :db, :hp


  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id 
    @name = name 
    @db = db
    @type = type
    @hp = hp

  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(number, db)
    pok = db.execute("SELECT * FROM pokemon WHERE id=?", number).flatten

    Pokemon.new(id: pok[0], name: pok[1], type: pok[2], hp: pok[3], db: db)
  end 
end
