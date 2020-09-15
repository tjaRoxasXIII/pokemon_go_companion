# require 'pry'
# require_relative './pokemon_info_importer.rb'
class Type

    attr_accessor :type_list, :type_name, :weakness, :strength

    @@all = []
    
    def initialize(type_name, weakness, strength)
            @type_name = type_name
            @weakness = weakness
            @strength = strength 
            @@all << self
    end

    def self.all
        @@all
    end

    def self.find_str_or_wkns(type1, type2 = nil)
        # binding.pry
        if type2 == nil
            pkmn_type = @@all.find {|type| type.type_name == type1}
                puts "Weak/Ineffective against: #{pkmn_type.weakness}"
                puts "Strong against: #{pkmn_type.strength}"
    #=> Additional logic needed to allow functionality of next feature
        # else
        #     pkmn_type1 = @@types_all.find {|type| type.type_name == type1}
        #     pkmn_type2 = @@types_all.find {|type| type.type_name == type2}
        #     pkmn_type1.weakness.delete_if {|type| pkmn_type2.strength.include?(type) && !pkmn_type2.weakness.include?(type)}
        end
        type1
    end
end