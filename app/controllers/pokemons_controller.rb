require 'json'
require 'open-uri'

class PokemonsController < ApplicationController

  def show
    @pokemon =
  end

  def new
  end

  def create

    url = "https://pokeapi.co/api/v2/pokemon/#{params[:name]}"
    pokemon_serialized = open(url).read
    a_pokemon_hash = JSON.parse(pokemon_serialized)
    @pokemon = Pokemon.create(name: a_pokemon_hash["name"],
                              pokemon_type: a_pokemon_hash["types"][0]["type"]["name"])
    redirect_to
  end
end

# url = "https://pokeapi.co/api/v2/pokemon/pikachu"
# pokemon_serialized = open(url).read
# a_pokemon_hash = JSON.parse(pokemon_serialized)
# puts a_pokemon_hash["name"]
# puts a_pokemon_hash["types"][0]["type"]["name"]
