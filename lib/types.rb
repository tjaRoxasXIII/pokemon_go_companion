require 'pry'
require_relative './pokemon_info_importer.rb'
class Types

    attr_accessor :type_list, :type_name, :weakness, :strength

    @@types_all = []
    @type_list = []

    Importer.new.pokedex_types.each do |type|
        @type_list << type
    end
    
    def initialize(type_name, weakness, strength)
            @type_name = type_name
            @weakness = weakness
            @strength = strength 
            @@types_all << self
    end
    
    def self.create(input = @type_list)
        input.each do |type|
            weakness = []
            strength = []
            type_name = type[0] 
            type[1].each do |power|
                if power[1] < 1.0
                    weakness << power[0]
                end
                if power[1] > 1.0
                    strength << power[0]
                end
            end
            Types.new(type_name, weakness, strength)
        end
    end

    def self.find_str_or_wkns(type1, type2 = nil)
        # binding.pry
        if type2 == nil
            pkmn_type = @@types_all.find {|type| type.type_name == type1}
                puts "Weak/Ineffective against: #{pkmn_type.weakness}"
                puts "Strong against: #{pkmn_type.strength}"
        else
            pkmn_type1 = @@types_all.find {|type| type.type_name == type1}
            pkmn_type2 = @@types_all.find {|type| type.type_name == type2}
            binding.pry
            pkmn_type1.weakness.delete_if {|type| pkmn_type2.strength.include?(type) && !pkmn_type2.weakness.include?(type)}
            binding.pry
        end
    end

    binding.pry
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