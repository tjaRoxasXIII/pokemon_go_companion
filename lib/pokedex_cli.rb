require "./lib/pokedex.rb"
class PokedexCLI

    attr_accessor :pokedex

    def initialize
        Pokedex.create
        puts "  _---_   "
        puts " |--O--|  "
        puts "  ¯---¯   "
        puts "Welcome, Trainer, to the Pokemon Go Companion app!"
        puts "If you want to be the very best, I can provide some helpful info."
    end
    
    def call
        puts "Please choose from the following:"
        puts "  1. Find a Pokemon by name"
        puts "  2. Find a Pokemon by their Pokedex number"
        puts "  3. Find a Pokemon by type"
        puts "  4. Show me the type chart"
        puts "  To quit, type 'quit'."
        puts "Please enter your choice:"
        input = gets.chomp

        if input == "1"
            puts "Please enter a name:"
            Pokedex.find_by_name
        end
        if input == "2"
            puts "Please enter a Pokedex ID number:"
            Pokedex.find_by_id
        end
        if input == "3"
            puts "Please enter a Pokemon Type:"
            Pokedex.find_by_type
            puts "You can search for another Pokemon type, type 'return' to go back, or 'quit' to quit."
            input = gets
            if input == "return"
                call
            end
            if input == "quit"
                puts "See you next time!"
            end
        end
        if input == "4"
            # Types.compare_types
        end

        if input == "quit"
            puts "See you next time!"
        end
        
        
    end

end

PokedexCLI.new.call