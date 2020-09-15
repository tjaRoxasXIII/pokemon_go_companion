# require "./lib/pokedex.rb"
class PokedexCLI

    def initialize
        Importer.new
        puts "  _---_                          _---_  "
        puts " |--0--|  Pokemon Go Companion  |--0--| "
        puts "  ¯---¯                          ¯---¯  "
        puts "Welcome, Trainer, to the Pokemon Go Companion app!"
        puts "If you want to be the very best, I can provide some helpful info."
    end
    
    def call
        puts "Please choose from the following (1-4):"
        puts "  1. Find a Pokemon by name"
        puts "  2. Find a Pokemon by their Pokedex number"
        puts "  3. Find a Pokemon by type"
        puts "  4. Search type comparisons"
        puts "  To quit, type 'quit'."
        puts "Please enter your choice:"
        case gets.chomp

        when "1"
            name_search
            call
        when "2"
            id_search
            call
        when "3"
            type_search
            call
        when "4"
            type_compare
            call
        when "quit"
            puts "See you next time!"
        else
            call
        end
        
    end
    
    def name_search
        puts "Please enter a name:"
        Pokemon.find_by_name
        if search_again?
            name_search
        else
        end
    end

    def id_search
        puts "Please enter a Pokedex ID number:"
        Pokemon.find_by_id
        if search_again?
            id_search
        else
        end
    end

    def type_search
        puts "Please enter a Pokemon Type:"
        Pokemon.find_by_type
        if search_again?
            type_search
        else
        end
    end

    def type_compare
        puts "Please enter a type you'd like to learn about:"
        input = gets.chomp.capitalize
        puts "#{input} Type Pokemon are"
        puts "-------------------------"
        Type.find_str_or_wkns(input)
        puts "-------------------------"
        if search_again?
            type_compare
        else
        end
    end

    def search_again?
        puts "Would you like to search again? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            return true
        elsif input == "N"
            puts "Alright, let's try something else!"
        else
            search_again?
        end
    end
        
end