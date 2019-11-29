class RemoveSpriteFrontalFromPokemons < ActiveRecord::Migration[5.2]
  def change
    remove_column :pokemons, :sprite_frontal, :string
  end
end
