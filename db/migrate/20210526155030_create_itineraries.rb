class CreateItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :itineraries do |t|
      t.string :which_team
      t.string :airline
      t.string :flight_number
      t.date :arrival
      t.date :depart
      t.string :transportation

      t.timestamps
    end
  end
end
