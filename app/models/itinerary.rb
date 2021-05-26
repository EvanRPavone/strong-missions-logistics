class Itinerary < ApplicationRecord
    belongs_to :user
    TRANSPORTATION = ['Pickup', 'Car Rental']
end
