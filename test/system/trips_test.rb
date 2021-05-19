require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "creating a Trip" do
    visit trips_url
    click_on "New Trip"

    fill_in "End time", with: @trip.end_time
    fill_in "Excursion", with: @trip.excursion
    fill_in "Excursion days", with: @trip.excursion_days
    fill_in "Lodging", with: @trip.lodging
    fill_in "Project", with: @trip.project
    fill_in "Start time", with: @trip.start_time
    fill_in "Team name", with: @trip.team_name
    fill_in "Team size", with: @trip.team_size
    fill_in "When excursion", with: @trip.when_excursion
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "updating a Trip" do
    visit trips_url
    click_on "Edit", match: :first

    fill_in "End time", with: @trip.end_time
    fill_in "Excursion", with: @trip.excursion
    fill_in "Excursion days", with: @trip.excursion_days
    fill_in "Lodging", with: @trip.lodging
    fill_in "Project", with: @trip.project
    fill_in "Start time", with: @trip.start_time
    fill_in "Team name", with: @trip.team_name
    fill_in "Team size", with: @trip.team_size
    fill_in "When excursion", with: @trip.when_excursion
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip" do
    visit trips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip was successfully destroyed"
  end
end
