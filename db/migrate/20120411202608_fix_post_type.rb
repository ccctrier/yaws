class FixPostType < ActiveRecord::Migration
  def change
    rename_column :posts, :type, :section 
  end  
end
