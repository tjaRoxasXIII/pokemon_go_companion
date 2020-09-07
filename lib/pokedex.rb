require 'pry'
require_relative 'pokemon_info_importer.rb'
class Pokedex

    pokedex = []

    Importer.parsed_pokemon.each do |pokemon|
        # binding.pry
        pokedex << pokemon.transform_keys(&:to_sym)
    end
    pokedex = pokedex.delete_if {|pokemon| pokemon[:form] == "Purified" || pokemon[:form] == "Shadow"}
    pokedex = pokedex.sort_by {|pokemon| pokemon[:form]}

    attr_accessor :name, :id, :type, :form

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

    def self.create(pokedex)
        pokedex.each do |pokemon|
            name = pokemon[:pokemon_name]
            id = pokemon[:pokemon_id]
            type = pokemon[:type]
            form = pokemon[:form]
            Pokedex.new(name, id, type, form)
        end
    end
    binding.pry
end


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