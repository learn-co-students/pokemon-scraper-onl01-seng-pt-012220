class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        card = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: card[0], name: card[1], type: card[2], :db => db)
    end
end
