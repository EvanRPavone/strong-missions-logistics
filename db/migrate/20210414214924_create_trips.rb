class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :team_name
      t.date :start_time
      t.date :end_time
      t.integer :team_size
      t.string :lodging
      t.string :project
      t.string :excursion
      t.string :when_excursion
      t.integer :excursion_days

      t.timestamps
    end
  end
end
