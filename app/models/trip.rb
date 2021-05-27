class Trip < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    LODGING = ['Strong Missions Center', 'Hotel', 'Bed & Breakfast']
    PROJECTS = ['Construction', 'Children Activities', 'Dance', 'Karate', 'Gardening', 'Other']
    EXCURSIONS = ['None', 'Beach', 'Hiking', 'Fishing', 'Ziplining', 'Coffee Tours', 'Nature', 'Other']
    WHEN_EXCURSIONS = ['Before', 'During', 'After']
    
    validates :start_time, :end_time, presence: true
    validate :end_time_after_start_time


    private

    def end_time_after_start_time
        return if end_time.blank? || start_time.blank?

        if end_time < start_time
            errors.add(:end_time, "must be after the start time")
        end
    end

end
