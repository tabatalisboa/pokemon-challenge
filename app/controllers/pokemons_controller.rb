require 'json'
require 'open-uri'


class PokemonsController < ApplicationController

  def show
    @pokemon = Pokemon.find(params[:id])

    url = "https://pokeapi.co/api/v2/pokemon/#{params[:id]}"
    pokemon_serialized = open(url).read
    pokemon_features = JSON.parse(pokemon_serialized)

    @pokemon = Pokemon.new(name: pokemon_features[:id], pokemon_type: pokemon_features["types"][0]["type"]["name"])

  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    redirect_to pokemon_url(@pokemon(params[:id]))
    # if @pokemon.save
    #   # redirect_to teams_root
    # else
    #   # redirect_to new_pokemon_path
    # end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end
end
