# Preview all emails at http://localhost:3000/rails/mailers/trip_mailer
class TripMailerPreview < ActionMailer::Preview


    def trip_scheduled
        TripMailer.with(trip: Trip.first, user: User.first).trip_scheduled
    end
end
