# require 'pry'
# require 'uri'
# require 'net/http'
# require 'openssl'
# require 'json'
class Importer

    attr_accessor :pokedex_list, :pokedex_types

    @@responses = []

    def initialize
        get_api_key
        pull_from_api(URI("https://pokemon-go1.p.rapidapi.com/pokemon_types.json"))
        @pokedex_list = @@responses[0]
        pull_from_api(URI("https://pokemon-go1.p.rapidapi.com/type_effectiveness.json"))
        @pokedex_types = @@responses[1]
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

    def self.pokedex_list
        @pokedex_list
    end

    def self.pokedex_types
        @pokedex_types
    end
    
end



