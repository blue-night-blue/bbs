class AddColumnPostid3 < ActiveRecord::Migration[7.0]
  def change
    add_column :post2s, :post_id, :integer
  end
end
