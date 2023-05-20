class AddPasswordColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :password, :string
  end
end
