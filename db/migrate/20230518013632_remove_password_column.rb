class RemovePasswordColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :password, :string
  end
end
