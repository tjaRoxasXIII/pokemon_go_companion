require 'pry'
require_relative 'pokemon_info_importer.rb'
class Pokedex

    @pokedex = []

    Importer.parsed_pokemon.each do |pokemon|
        # binding.pry
        @pokedex << pokemon.transform_keys(&:to_sym)
    end
    @pokedex = @pokedex.delete_if {|pokemon| pokemon[:form] == "Purified" || pokemon[:form] == "Shadow"}
    @pokedex = @pokedex.sort_by {|pokemon| pokemon[:form]}

    attr_accessor :pokedex, :name, :id, :type, :form

    @@all = []

    def initialize(name, id, type, form)
        @name = name
        @id = id
        @type = type
        @form = form
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(input = @pokedex)
        input.each do |pokemon|
            name = pokemon[:pokemon_name]
            id = pokemon[:pokemon_id]
            type = pokemon[:type]
            form = pokemon[:form]
            Pokedex.new(name, id, type, form)
        end
    end

    def self.find_by_name
        input = gets.chomp
        # binding.pry
        self.all.find_all {|pokemon| pokemon.name == input}.each do |pokemon|
            puts "----------------------"
            puts "Name: #{pokemon.name}"
            puts "Pokedex ID: #{pokemon.id}"
            puts "Type(s): #{pokemon.type}"
            puts "Form: #{pokemon.form}"
            puts "----------------------"
        end
        
    end

    def self.find_by_id
        input = gets.chomp.to_i
        self.all.find_all {|pokemon| pokemon.id == input}
    end

    
end
