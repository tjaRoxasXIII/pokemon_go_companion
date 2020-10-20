# require 'pry'
# require 'uri'
# require 'net/http'
# require 'openssl'
# require 'json'
class Importer

    attr_accessor :pokemon_list, :pokemon_types

    @@responses = []

    def initialize
        get_api_key
        create_pokemon
        create_types
    end
    
    def pull_from_api(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'pokemon-go1.p.rapidapi.com'
        request["x-rapidapi-key"] = @@key

        response = http.request(request)
        parsed_info = JSON.parse(response.body)
        @@responses << parsed_info
    end

    def get_api_key
        begin
            @@key = File.open("../API_key.txt").read.strip
        rescue
            puts "Looks like you're missing your API key!  It should be stored in the 'root' folder of your repo. I.E: ../API_key.txt"
            puts "You can request a key from https://rapidapi.com/chewett/api/pokemon-go1 or you can enter yours manually now and the necessary file will be created:"
            @@key = gets.strip
            return if @@key == "exit"
            File.open(File.expand_path("../API_key.txt"), "w") do |file|
                file.print @@key
            end
        end
        @@key
    end

    def create_pokemon
        @pokemon_list = []
        pull_from_api(URI("https://pokemon-go1.p.rapidapi.com/pokemon_types.json"))
        @@responses[0].each do |pokemon|
            name = pokemon["pokemon_name"]
            id = pokemon["pokemon_id"]
            type = pokemon["type"]
            form = pokemon["form"]
            if pokemon["form"] != "Purified" && pokemon["form"] != "Shadow"
                Pokemon.new(name, id, type, form)
            end
        end
        @pokemon_list = @pokemon_list.sort_by {|pokemon| pokemon[:form]}
        self.pokemon_list = @pokemon_list
    end

    def create_types
        @type_list = []
        pull_from_api(URI("https://pokemon-go1.p.rapidapi.com/type_effectiveness.json"))
        @@responses[1].each do |type|
            weakness = []
            strength = []
            str_val = []
            wkns_val = []
            type_name = type[0] 
            type[1].each do |power|
                if power[1] < 1.0
                    weakness << power
                end
                if power[1] > 1.0
                    strength << power
                end
            end
            Type.new(type_name, weakness, strength)
        end
    end

    def self.pokemon
        @pokemon_list
    end
    
end



