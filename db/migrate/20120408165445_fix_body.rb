class FixBody < ActiveRecord::Migration
  def change
    rename_column :posts, :body, :content
  end
end
