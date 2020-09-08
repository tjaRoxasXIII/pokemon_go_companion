require 'pry'
require_relative 'pokemon_info_importer.rb'
class Types

    types = []

    Importer.parsed_types.each do |type|
        # binding.pry
        types << type
    end

    binding.pry


    #=> Will recieve types from pokedex by calling a specific pokemon.  Based on type(s) returned, compare strengths and weaknesses and return.
    #=> Comparison should be against 1.0 for one type or 2.0 for 2 types i.e [if type == "Bug",  type_hash.each, if type < 1 return "Weakness", if type > 1 return "Strength"]
    #=> Two types should add values.  Bug, Dark => vs Dark ---- Bug[vsDark = 1.6], Dark[vsDark = .625]
    def type_checker
        
    end
end