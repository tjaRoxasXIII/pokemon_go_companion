# require 'pry'
# require_relative './pokemon_info_importer.rb'
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

    def self.all
        @@types_all
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
    #=> Additional logic needed to allow functionality of next feature
        # else
        #     pkmn_type1 = @@types_all.find {|type| type.type_name == type1}
        #     pkmn_type2 = @@types_all.find {|type| type.type_name == type2}
        #     pkmn_type1.weakness.delete_if {|type| pkmn_type2.strength.include?(type) && !pkmn_type2.weakness.include?(type)}
        end
        type1
    end
end