require 'pry'
require_relative 'pokemon_info_importer.rb'
class Pokedex

    @pokedex = []

    Importer.parsed_pokemon.each do |pokemon|
        # binding.pry
        @pokedex << pokemon.transform_keys(&:to_sym)
    end
    @pokedex = @pokedex.delete_if {|pokemon| pokemon[:form] == "Purified" || pokemon[:form] == "Shadow"}
    @pokedex = @pokedex.sort_by {|pokemon| pokemon[:form]}

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

    def self.create(input = @pokedex)
        input.each do |pokemon|
            name = pokemon[:pokemon_name]
            id = pokemon[:pokemon_id]
            type = pokemon[:type]
            form = pokemon[:form]
            Pokedex.new(name, id, type, form)
        end
    end

    def self.find_by_name
        input = gets.chomp
        self.all.find_all {|pokemon| pokemon.name == input}
    end

    # binding.pry
    
end
Pokedex.create
# Pokedex.find_by_name
binding.pry

#     @@all = []

#     def get_pokemon
#         @@all << parsed_pokemon.find("pokemon_name")
#         binding.pry
#     end

#     def self.all
#         @@all
#     end
#     binding.pry
# end

# puts Pokedex.all