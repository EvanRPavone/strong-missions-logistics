require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { end_time: @trip.end_time, excursion: @trip.excursion, excursion_days: @trip.excursion_days, lodging: @trip.lodging, project: @trip.project, start_time: @trip.start_time, team_name: @trip.team_name, team_size: @trip.team_size, when_excursion: @trip.when_excursion } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { end_time: @trip.end_time, excursion: @trip.excursion, excursion_days: @trip.excursion_days, lodging: @trip.lodging, project: @trip.project, start_time: @trip.start_time, team_name: @trip.team_name, team_size: @trip.team_size, when_excursion: @trip.when_excursion } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
