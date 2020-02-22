require "application_system_test_case"

class TalentProfilesTest < ApplicationSystemTestCase
  setup do
    @talent_profile = talent_profiles(:one)
  end

  test "visiting the index" do
    visit talent_profiles_url
    assert_selector "h1", text: "Talent Profiles"
  end

  test "creating a Talent profile" do
    visit talent_profiles_url
    click_on "New Talent Profile"

    fill_in "Description", with: @talent_profile.description
    fill_in "User", with: @talent_profile.user_id
    click_on "Create Talent profile"

    assert_text "Talent profile was successfully created"
    click_on "Back"
  end

  test "updating a Talent profile" do
    visit talent_profiles_url
    click_on "Edit", match: :first

    fill_in "Description", with: @talent_profile.description
    fill_in "User", with: @talent_profile.user_id
    click_on "Update Talent profile"

    assert_text "Talent profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Talent profile" do
    visit talent_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talent profile was successfully destroyed"
  end
end
