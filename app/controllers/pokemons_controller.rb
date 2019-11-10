require 'json'
require 'open-uri'

class PokemonsController < ApplicationController
  before_action :find_pokemon
  def show
    @pokemon = Pokemon.find(params[:id])
    @pokemon = Pokemon.new(name: pokemon_features[:name], pokemon_type: pokemon_features["types"][0]["type"]["name"])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to :show
    else
      redirect_to new_pokemon_path
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end

  def find_pokemon
    url = "https://pokeapi.co/api/v2/pokemon/#{params[:id]}"
    pokemon_serialized = open(url).read
    pokemon_features = JSON.parse(pokemon_serialized)
  end
end
