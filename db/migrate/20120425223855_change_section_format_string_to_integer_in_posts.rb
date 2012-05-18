class ChangeSectionFormatStringToIntegerInPosts < ActiveRecord::Migration
  def up
    change_column :Posts, :section, :integer
  end

  def down
    change_column :Posts, :section, :string
  end
end
