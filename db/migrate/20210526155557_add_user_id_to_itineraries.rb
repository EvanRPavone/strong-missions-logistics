class AddUserIdToItineraries < ActiveRecord::Migration[6.1]
  def change
    add_column :itineraries, :user_id, :integer
    add_index :itineraries, :user_id
  end
end
