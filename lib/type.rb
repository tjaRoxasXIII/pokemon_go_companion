require 'pry'
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
            binding.pry
                puts "Weak/Ineffective against:".colorize(:red) + " #{pkmn_type.weakness.collect {|a| a[0]}}"
                puts "Strong against:".colorize(:green) + " #{pkmn_type.strength}"
    # => Additional logic needed to allow functionality of next feature
        # Basically, if type1 is weak against a certain type, but type2 is strong against that same type, it should remove that type from the strength and weakness list    
        # else
        #     pkmn_type1 = @@types_all.find {|type| type.type_name == type1}
        #     pkmn_type2 = @@types_all.find {|type| type.type_name == type2}
        #     combined_strength = pkmn_type1.strength.collect {|a| a}
        end
        type1
    end
end