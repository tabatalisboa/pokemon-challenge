class AddPokemonTypeToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :pokemon_type, :string
  end
end
