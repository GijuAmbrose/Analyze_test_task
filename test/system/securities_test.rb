require "application_system_test_case"

class SecuritiesTest < ApplicationSystemTestCase
  setup do
    @security = securities(:one)
  end

  test "visiting the index" do
    visit securities_url
    assert_selector "h1", text: "Securities"
  end

  test "creating a Security" do
    visit securities_url
    click_on "New Security"

    fill_in "Coupon rate", with: @security.coupon_rate
    fill_in "Face value", with: @security.face_value
    fill_in "Isin", with: @security.isin
    fill_in "Issue date", with: @security.issue_date
    fill_in "Maturity date", with: @security.maturity_date
    fill_in "Outstanding stock", with: @security.outstanding_stock
    fill_in "Security name", with: @security.security_name
    click_on "Create Security"

    assert_text "Security was successfully created"
    click_on "Back"
  end

  test "updating a Security" do
    visit securities_url
    click_on "Edit", match: :first

    fill_in "Coupon rate", with: @security.coupon_rate
    fill_in "Face value", with: @security.face_value
    fill_in "Isin", with: @security.isin
    fill_in "Issue date", with: @security.issue_date
    fill_in "Maturity date", with: @security.maturity_date
    fill_in "Outstanding stock", with: @security.outstanding_stock
    fill_in "Security name", with: @security.security_name
    click_on "Update Security"

    assert_text "Security was successfully updated"
    click_on "Back"
  end

  test "destroying a Security" do
    visit securities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Security was successfully destroyed"
  end
end
