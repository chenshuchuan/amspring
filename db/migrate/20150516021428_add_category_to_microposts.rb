class AddCategoryToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :category, :string
    add_index :microposts, :category
  end
end
