class Trip < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    LODGING = ['Strong Missions Center', 'Hotel', 'Bed & Breakfast']
    PROJECTS = ['Construction', 'Children Activities', 'Dance', 'Karate', 'Gardening', 'Other']
    EXCURSIONS = ['None', 'Beach', 'Hiking', 'Fishing', 'Ziplining', 'Coffee Tours', 'Nature', 'Other']
    WHEN_EXCURSIONS = ['Before', 'During', 'After']
end
