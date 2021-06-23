require "application_system_test_case"

class EventtsTest < ApplicationSystemTestCase
  setup do
    @eventt = eventts(:one)
  end

  test "visiting the index" do
    visit eventts_url
    assert_selector "h1", text: "Eventts"
  end

  test "creating a Eventt" do
    visit eventts_url
    click_on "New Eventt"

    fill_in "Creator", with: @eventt.creator_id
    fill_in "Description", with: @eventt.description
    fill_in "Title", with: @eventt.title
    click_on "Create Eventt"

    assert_text "Eventt was successfully created"
    click_on "Back"
  end

  test "updating a Eventt" do
    visit eventts_url
    click_on "Edit", match: :first

    fill_in "Creator", with: @eventt.creator_id
    fill_in "Description", with: @eventt.description
    fill_in "Title", with: @eventt.title
    click_on "Update Eventt"

    assert_text "Eventt was successfully updated"
    click_on "Back"
  end

  test "destroying a Eventt" do
    visit eventts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eventt was successfully destroyed"
  end
end
