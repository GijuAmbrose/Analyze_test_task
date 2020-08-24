require "application_system_test_case"

class PortFoliosTest < ApplicationSystemTestCase
  setup do
    @port_folio = port_folios(:one)
  end

  test "visiting the index" do
    visit port_folios_url
    assert_selector "h1", text: "Port Folios"
  end

  test "creating a Port folio" do
    visit port_folios_url
    click_on "New Port Folio"

    click_on "Create Port folio"

    assert_text "Port folio was successfully created"
    click_on "Back"
  end

  test "updating a Port folio" do
    visit port_folios_url
    click_on "Edit", match: :first

    click_on "Update Port folio"

    assert_text "Port folio was successfully updated"
    click_on "Back"
  end

  test "destroying a Port folio" do
    visit port_folios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Port folio was successfully destroyed"
  end
end
