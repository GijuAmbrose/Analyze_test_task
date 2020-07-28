require "application_system_test_case"

class InterestFrequenciesTest < ApplicationSystemTestCase
  setup do
    @interest_frequency = interest_frequencies(:one)
  end

  test "visiting the index" do
    visit interest_frequencies_url
    assert_selector "h1", text: "Interest Frequencies"
  end

  test "creating a Interest frequency" do
    visit interest_frequencies_url
    click_on "New Interest Frequency"

    fill_in "Frequency", with: @interest_frequency.frequency
    click_on "Create Interest frequency"

    assert_text "Interest frequency was successfully created"
    click_on "Back"
  end

  test "updating a Interest frequency" do
    visit interest_frequencies_url
    click_on "Edit", match: :first

    fill_in "Frequency", with: @interest_frequency.frequency
    click_on "Update Interest frequency"

    assert_text "Interest frequency was successfully updated"
    click_on "Back"
  end

  test "destroying a Interest frequency" do
    visit interest_frequencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interest frequency was successfully destroyed"
  end
end
