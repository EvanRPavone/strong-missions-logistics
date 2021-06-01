class Itinerary < ApplicationRecord
    extend FriendlyId
    belongs_to :user
    TRANSPORTATION = ['Pickup', 'Car Rental']
    friendly_id :which_team, use: :slugged
end
