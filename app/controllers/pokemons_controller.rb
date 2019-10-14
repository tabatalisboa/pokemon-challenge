require 'json'
require 'open-uri'

class PokemonsController < ApplicationController

  def new
    url = "https://pokeapi.co/api/v2/pokemon/#{params[:name]}"
  end

  def create
    url = "https://pokeapi.co/api/v2/pokemon/#{params[:name]}"
    pokemon_serialized = open(url).read
    a_pokemon_hash = JSON.parse(pokemon_serialized)
    @pokemon = Pokemon.create(name: a_pokemon_hash["name"],
                              pokemon_type: a_pokemon_hash["types"][0]["type"]["name"])
  end
end
