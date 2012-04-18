class AddPublishedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :published, :boolean
    add_column :events, :published_at, :datetime
  end
end
