class AddTripStepsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rdyForItinerary, :boolean, default: false
    add_column :users, :rdyToPay, :boolean, default: false
  end
end
