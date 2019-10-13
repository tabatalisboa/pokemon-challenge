class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :profile_image, :string
  end
end
