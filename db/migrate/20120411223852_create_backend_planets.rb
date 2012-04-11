class CreateBackendPlanets < ActiveRecord::Migration
  def change
    create_table :backend_planets do |t|
      t.string :url

      t.timestamps
    end
  end
end
