require "application_system_test_case"

class ClientTypesTest < ApplicationSystemTestCase
  setup do
    @client_type = client_types(:one)
  end

  test "visiting the index" do
    visit client_types_url
    assert_selector "h1", text: "Client Types"
  end

  test "creating a Client type" do
    visit client_types_url
    click_on "New Client Type"

    fill_in "Client type", with: @client_type.client_type
    click_on "Create Client type"

    assert_text "Client type was successfully created"
    click_on "Back"
  end

  test "updating a Client type" do
    visit client_types_url
    click_on "Edit", match: :first

    fill_in "Client type", with: @client_type.client_type
    click_on "Update Client type"

    assert_text "Client type was successfully updated"
    click_on "Back"
  end

  test "destroying a Client type" do
    visit client_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client type was successfully destroyed"
  end
end
