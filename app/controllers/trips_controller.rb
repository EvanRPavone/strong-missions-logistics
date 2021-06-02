class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: [:active_sessions]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /trips or /trips.json
  def index
    if current_user.admin?
      @trips = Trip.all
    else
      @trips = current_user.trips.where(user_id: current_user)
    end
  end

  # GET /trips/1 or /trips/1.json
  def show
    @comment = Comment.new
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
        TripMailer.with(trip: @trip, user: current_user).trip_scheduled
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def active_sessions
    @active_sessions = Trip.where("end_time > ?", Time.now)
  end

  def correct_user #finds the post_id that is associated to the current_user id. if the user does not own that post then it will redirect them to the posts index page with a notice.
    @trip = current_user.trips.find_by(id: params[:id])
    redirect_to trips_path, notice: 'not authorized to edit this post' if @trip.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:team_name, :start_time, :end_time, :team_size, :lodging, :project, :excursion, :when_excursion, :excursion_days, :user_id)
    end

    def must_be_admin
        unless current_user.admin?
            redirect_to trips_path, alert: "You don't have access to this page"
        end
    end
end
