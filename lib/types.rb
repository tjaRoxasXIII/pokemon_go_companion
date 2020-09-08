# require 'pry'
# require_relative './pokemon_info_importer.rb'
class Types

    attr_accessor :type_name, :weakness, :strength

    @@types = []

    def initialize(build_types)
            @type_name = type[0]
            @weakness = []
            @strengths = []
            @@types << self
    end
    
    # def build_types
    #     Importer.parsed_types.each do |type|
    #     end
    # end
    

    # binding.pry
    #=> Will recieve types from pokedex by calling a specific pokemon.  Based on type(s) returned, compare strengths and weaknesses and return.
    #=> Comparison should be against 1.0 for one type or 2.0 for 2 types i.e [if type == "Bug",  type_hash.each, if type < 1 return "Weakness", if type > 1 return "Strength"]
    #=> Two types should add values.  Bug, Dark => vs Dark ---- Bug[vsDark = 1.6], Dark[vsDark = .625]
#     def type_checker(type1, type2 = nil)
#         types.include? {|type| type == type1}.each do |effectiveness|
#             binding.pry
#             if effectiveness.values < 1.0
#                 weakness << effectiveness
#             elsif effectiveness.values > 1.0
#                 strength << effectiveness
#             end
#         end
#     end
end