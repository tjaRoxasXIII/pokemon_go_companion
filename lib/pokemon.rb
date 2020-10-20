class Pokemon

    attr_accessor :pokedex, :name, :id, :type, :form

    @@all = []

    def initialize(name, id, type, form)
        @name = name
        @id = id
        @type = type
        @form = form
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_by_name
        @@all.sort_by {|pokemon| pokemon.name}
    end

    def self.find_by_name
        input = gets.chomp.capitalize
        self.all.find_all {|pokemon| pokemon.name == input}.each do |pokemon|
            puts "----------------------".colorize(:red)
            puts "Name: #{pokemon.name}"
            puts "Pokedex ID: #{pokemon.id}"
            puts "Type(s): #{pokemon.type}"
            puts "Form: #{pokemon.form}"
            puts "----------------------".colorize(:red)
        end
        
    end

    def self.find_by_id
        input = gets.chomp.to_i
        self.all.find_all {|pokemon| pokemon.id == input}.each do |pokemon|
            puts "----------------------".colorize(:red)
            puts "Name: #{pokemon.name}"
            puts "Pokedex ID: #{pokemon.id}"
            puts "Type(s): #{pokemon.type}"
            puts "Form: #{pokemon.form}"
            puts "----------------------".colorize(:red)
        end
    end

    def self.find_by_type
        input = gets.chomp.capitalize
        self.all.find_all {|pokemon| pokemon.type.include?(input)}.each do |pokemon|
            puts "----------------------".colorize(:red)
            puts "Name: #{pokemon.name}"
            puts "Pokedex ID: #{pokemon.id}"
            puts "Type(s): #{pokemon.type}"
            puts "Form: #{pokemon.form}"
            puts "----------------------".colorize(:red)
        end

    end

    
end
