class CreatePost2s < ActiveRecord::Migration[7.0]
  def change
    create_table :post2s do |t|
      t.string :name
      t.text :content
      t.string :password_digest

      t.timestamps
    end
  end
end
