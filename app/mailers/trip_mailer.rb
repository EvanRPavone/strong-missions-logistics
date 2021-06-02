class TripMailer < ApplicationMailer
    helper :application

    default from: "notifications@strongmissions.com"

    def trip_scheduled
        @trip = params[:trip]
        @user = params[:user]

        mail(to: @user.email, subject: "Strong Missions Team Registered")
    end
end
