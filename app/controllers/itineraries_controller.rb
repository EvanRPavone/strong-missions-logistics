class ItinerariesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_itinerary, only: [:edit, :update, :show, :destroy]
    before_action :set_trip

    def new
        @itinerary = Itinerary.new
    end

    def create
        @itinerary = @trip.itineraries.create(params[:itinerary].permit(:airline, :flight_number, :arrival, :depart, :transportation, :trip_id))
        @itinerary.user_id = current_user.id

        respond_to do |format|
            if @itinerary.save
                format.html { redirect_to trip_path(@trip) }
                format.js #render create.js.erb
            else
                format.html { redirect_to trip_path(@trip), notice: "Your itinerary did not save. Try again" }
                format.js
            end
        end
    end

    def destroy
        @itinerary = @trip.itineraries.find(params[:id])
        @itinerary.destroy
        redirect_to trip_path(@trip)
    end

    private

    def set_trip
        @trip = Trip.find(params[:trip_id])
    end

    def set_itinerary
        @itinerary = Itinerary.find(params[:id])
    end

    def itinerary_params
        params.require(:itinerary).permit(:airline, :flight_number, :arrival, :depart, :transportation)
    end

end
