require "application_system_test_case"

class ArchivalNdsomsTest < ApplicationSystemTestCase
  setup do
    @archival_ndsom = archival_ndsoms(:one)
  end

  test "visiting the index" do
    visit archival_ndsoms_url
    assert_selector "h1", text: "Archival Ndsoms"
  end

  test "creating a Archival ndsom" do
    visit archival_ndsoms_url
    click_on "New Archival Ndsom"

    click_on "Create Archival ndsom"

    assert_text "Archival ndsom was successfully created"
    click_on "Back"
  end

  test "updating a Archival ndsom" do
    visit archival_ndsoms_url
    click_on "Edit", match: :first

    click_on "Update Archival ndsom"

    assert_text "Archival ndsom was successfully updated"
    click_on "Back"
  end

  test "destroying a Archival ndsom" do
    visit archival_ndsoms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Archival ndsom was successfully destroyed"
  end
end
