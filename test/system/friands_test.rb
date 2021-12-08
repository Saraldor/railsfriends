require "application_system_test_case"

class FriandsTest < ApplicationSystemTestCase
  setup do
    @friand = friands(:one)
  end

  test "visiting the index" do
    visit friands_url
    assert_selector "h1", text: "Friands"
  end

  test "creating a Friand" do
    visit friands_url
    click_on "New Friand"

    fill_in "Email", with: @friand.email
    fill_in "Facebook", with: @friand.facebook
    fill_in "First name", with: @friand.first_name
    fill_in "Last name", with: @friand.last_name
    fill_in "Phone", with: @friand.phone
    click_on "Create Friand"

    assert_text "Friand was successfully created"
    click_on "Back"
  end

  test "updating a Friand" do
    visit friands_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friand.email
    fill_in "Facebook", with: @friand.facebook
    fill_in "First name", with: @friand.first_name
    fill_in "Last name", with: @friand.last_name
    fill_in "Phone", with: @friand.phone
    click_on "Update Friand"

    assert_text "Friand was successfully updated"
    click_on "Back"
  end

  test "destroying a Friand" do
    visit friands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friand was successfully destroyed"
  end
end
