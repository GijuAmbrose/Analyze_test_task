require "application_system_test_case"

class IssuersTest < ApplicationSystemTestCase
  setup do
    @issuer = issuers(:one)
  end

  test "visiting the index" do
    visit issuers_url
    assert_selector "h1", text: "Issuers"
  end

  test "creating a Issuer" do
    visit issuers_url
    click_on "New Issuer"

    fill_in "Name", with: @issuer.name
    click_on "Create Issuer"

    assert_text "Issuer was successfully created"
    click_on "Back"
  end

  test "updating a Issuer" do
    visit issuers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @issuer.name
    click_on "Update Issuer"

    assert_text "Issuer was successfully updated"
    click_on "Back"
  end

  test "destroying a Issuer" do
    visit issuers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Issuer was successfully destroyed"
  end
end
