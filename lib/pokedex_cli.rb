# require "./lib/pokedex.rb"
class PokedexCLI

    attr_accessor :pokedex

    def initialize
        Pokedex.create
        Types.create
        puts "  _---_                          _---_  "
        puts " |--0--|  Pokemon Go Companion  |--0--| "
        puts "  ¯---¯                          ¯---¯  "
        puts "Welcome, Trainer, to the Pokemon Go Companion app!"
        puts "If you want to be the very best, I can provide some helpful info."
    end
    
    def call
        puts "Please choose from the following:"
        puts "  1. Find a Pokemon by name"
        puts "  2. Find a Pokemon by their Pokedex number"
        puts "  3. Find a Pokemon by type"
        puts "  4. Search type comparisons"
        puts "  To quit, type 'quit'."
        puts "Please enter your choice:"
        input = gets.chomp

        if input == "1"
            name_search
            call
        end

        if input == "2"
            id_search
            call
        end

        if input == "3"
            type_search
            call
        end

        if input == "4"
            type_compare
            call
        end

        if input == "quit"
            puts "See you next time!"
        end
        
    end


    
    def name_search
        puts "Please enter a name:"
        Pokedex.find_by_name
        search_again_by_name
    end

    def id_search
        puts "Please enter a Pokedex ID number:"
        Pokedex.find_by_id
        search_again_by_id
    end

    def type_search
        puts "Please enter a Pokemon Type:"
        Pokedex.find_by_type
        search_again_by_type
    end

    def type_compare
        puts "Please enter a type you'd like to learn about:"
        input = gets.chomp.capitalize
        puts "#{input} Type Pokemon are"
        puts "-------------------------"
        Types.find_str_or_wkns(input)
        puts "-------------------------"
        search_new_type
    end

    def search_again_by_name
        puts "Would you like to search for another Pokemon? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            name_search
        end
        if input == "N"
            puts "Alright, let's try something else!"
        end
    end

    def search_again_by_id
        puts "Would you like to search for another Pokemon? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            id_search
        end
        if input == "N"
            puts "Alright, let's try something else!"
        end
        
    end

    def search_again_by_type
        puts "Would you like to search for another Type? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            type_search
        end
        if input == "N"
            puts "Alright, let's try something else!"
        end
    end

    def search_new_type
        puts "Would you like to search for another Type? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            type_compare
        end
        if input == "N"
            puts "Alright, let's try something else!"
        end
    end
        
end