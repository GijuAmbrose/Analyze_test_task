require "application_system_test_case"

class SecurityTypesTest < ApplicationSystemTestCase
  setup do
    @security_type = security_types(:one)
  end

  test "visiting the index" do
    visit security_types_url
    assert_selector "h1", text: "Security Types"
  end

  test "creating a Security type" do
    visit security_types_url
    click_on "New Security Type"

    fill_in "Security type name", with: @security_type.security_type_name
    click_on "Create Security type"

    assert_text "Security type was successfully created"
    click_on "Back"
  end

  test "updating a Security type" do
    visit security_types_url
    click_on "Edit", match: :first

    fill_in "Security type name", with: @security_type.security_type_name
    click_on "Update Security type"

    assert_text "Security type was successfully updated"
    click_on "Back"
  end

  test "destroying a Security type" do
    visit security_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Security type was successfully destroyed"
  end
end
