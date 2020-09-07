require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Importer

    attr_accessor :pokedex_list, :type_list

    url = URI("https://pokemon-go1.p.rapidapi.com/pokemon_types.json")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'pokemon-go1.p.rapidapi.com'
    request["x-rapidapi-key"] = '1aa6e22f01msh13f5cec425c1bddp13dda9jsndb8dd7b434e1'

    response = http.request(request)
    parsed_pokemon = JSON.parse(response.body)



    url2 = URI("https://pokemon-go1.p.rapidapi.com/type_effectiveness.json")

    http2 = Net::HTTP.new(url2.host, url2.port)
    http2.use_ssl = true
    http2.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request2 = Net::HTTP::Get.new(url2)
    request2["x-rapidapi-host"] = 'pokemon-go1.p.rapidapi.com'
    request2["x-rapidapi-key"] = '1aa6e22f01msh13f5cec425c1bddp13dda9jsndb8dd7b434e1'

    response2 = http2.request(request2)
    parsed_types = JSON.parse(response2.body)

    
        @pokedex_list = parsed_pokemon
        @pokedex_types = parsed_types
    

    def self.parsed_pokemon
        @pokedex_list
    end

    def self.parsed_types
        @pokedex_types
    end
end



