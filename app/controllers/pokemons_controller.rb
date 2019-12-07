require 'json'
require 'open-uri'

class PokemonsController < ApplicationController
  before_action :find_pokemon, only: [:new, :create]

  def index
  end

  # def show
  #   @pokemon = Pokemon.find(params[:id])
  #   @pokemon = Pokemon.new(name: pokemon_features[:name], pokemon_type: pokemon_features["types"][0]["type"]["name"])
  # end

  def new
    @pokemon = Pokemon.new
    @pokemon.name = @pokemon_json["name"]
    @pokemon.pokemon_type = @pokemon_json["types"][0]["type"]["name"]
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.team = current_user.teams.first
    @pokemon.save
    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end

  def find_pokemon
    url = "https://pokeapi.co/api/v2/pokemon/#{params[:name]}"
    pokemon_serialized = open(url).read
    @pokemon_json = JSON.parse(pokemon_serialized)
  end
end
