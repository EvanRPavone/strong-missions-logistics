class ItinerariesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_itinerary, only: %i[ show edit update destroy ]
    before_action :must_be_admin, only: [:active_sessions]
  
    # GET /trips or /trips.json
    def index
      if current_user.admin?
        @itineraries = Itinerary.all
      else
        @itineraries = current_user.itineraries.where(user_id: current_user)
      end
    end
  
    # GET /trips/1 or /trips/1.json
    def show
    end
  
    # GET /trips/new
    def new
      @itinerary = Itinerary.new
    end
  
    # GET /trips/1/edit
    def edit
    end
  
    # POST /trips or /trips.json
    def create
      @itinerary = Itinerary.new(itinerary_params)
      @itinerary.user_id = current_user.id
  
      respond_to do |format|
        if @itinerary.save
          format.html { redirect_to @itinerary, notice: "Itinerary was successfully created." }
          format.json { render :show, status: :created, location: @itinerary }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @itinerary.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /trips/1 or /trips/1.json
    def update
      respond_to do |format|
        if @itinerary.update(itinerary_params)
          format.html { redirect_to @itinerary, notice: "Itinerary was successfully updated." }
          format.json { render :show, status: :ok, location: @itinerary }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @itinerary.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /trips/1 or /trips/1.json
    def destroy
      @itinerary.destroy
      respond_to do |format|
        format.html { redirect_to itineraries_url, notice: "Itinerary was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    def active_sessions
      @active_sessions = Itinerary.where("end_time > ?", Time.now)
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_itinerary
        @itinerary = Itinerary.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def itinerary_params
        params.require(:itinerary).permit(:which_team, :airline, :flight_number, :arrival, :depart, :transportation, :user_id)
      end
  
      def must_be_admin
          unless current_user.admin?
              redirect_to trips_path, alert: "You don't have access to this page"
          end
      end
  end
  