class RenameColumnCategoryToMicroposts < ActiveRecord::Migration
  def change
  	rename_column :microposts, :category, :categ_name
  end
end
