class CreateBackendPlanetEntries < ActiveRecord::Migration
  def change
    create_table :backend_planet_entries do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid

      t.timestamps
    end
  end
end
