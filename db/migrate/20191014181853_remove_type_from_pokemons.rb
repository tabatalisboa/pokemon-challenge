class RemoveTypeFromPokemons < ActiveRecord::Migration[5.2]
  def change
    remove_column :pokemons, :type, :string
  end
end
