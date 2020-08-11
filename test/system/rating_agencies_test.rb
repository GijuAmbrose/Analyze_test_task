require "application_system_test_case"

class RatingAgenciesTest < ApplicationSystemTestCase
  setup do
    @rating_agency = rating_agencies(:one)
  end

  test "visiting the index" do
    visit rating_agencies_url
    assert_selector "h1", text: "Rating Agencies"
  end

  test "creating a Rating agency" do
    visit rating_agencies_url
    click_on "New Rating Agency"

    fill_in "Rating agency name", with: @rating_agency.rating_agency_name
    click_on "Create Rating agency"

    assert_text "Rating agency was successfully created"
    click_on "Back"
  end

  test "updating a Rating agency" do
    visit rating_agencies_url
    click_on "Edit", match: :first

    fill_in "Rating agency name", with: @rating_agency.rating_agency_name
    click_on "Update Rating agency"

    assert_text "Rating agency was successfully updated"
    click_on "Back"
  end

  test "destroying a Rating agency" do
    visit rating_agencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rating agency was successfully destroyed"
  end
end
