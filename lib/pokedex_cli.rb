# require "./lib/pokedex.rb"
class PokedexCLI

    attr_accessor :pokedex

    def initialize
        Pokedex.create
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
            exit_search
        end

        if input == "2"
            id_search
            exit_search
        end

        if input == "3"
            type_search
            exit_search
        end

        if input == "4"
            # Types.compare_types
        end

        if input == "quit"
            puts "See you next time!"
        end
        
    end

    def name_search
        puts "Please enter a name:"
        Pokedex.find_by_name
        search_again
    end

    def id_search
        puts "Please enter a Pokedex ID number:"
        Pokedex.find_by_id
        search_again
    end

    def type_search
        puts "Please enter a Pokemon Type:"
        Pokedex.find_by_type
        search_again
    end

    def search_again
        puts "Would you like to search for another Pokemon? Y/N:"
        input = gets.chomp.upcase
        if input == "Y"
            name_search
        end
        if input == "N"
            puts "Alright, let's try something else!"
        end
    end

    def exit_search
        puts "Type 'return' to go back, or 'quit' to quit."
        input = gets.chomp
        if input == "return"
            self.call
        end
        if input == "quit"
            puts "See you next time!"
        end
    end

end