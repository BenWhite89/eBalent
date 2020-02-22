require 'test_helper'

class TalentProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talent_profile = talent_profiles(:one)
  end

  test "should get index" do
    get talent_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_talent_profile_url
    assert_response :success
  end

  test "should create talent_profile" do
    assert_difference('TalentProfile.count') do
      post talent_profiles_url, params: { talent_profile: { description: @talent_profile.description, user_id: @talent_profile.user_id } }
    end

    assert_redirected_to talent_profile_url(TalentProfile.last)
  end

  test "should show talent_profile" do
    get talent_profile_url(@talent_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_talent_profile_url(@talent_profile)
    assert_response :success
  end

  test "should update talent_profile" do
    patch talent_profile_url(@talent_profile), params: { talent_profile: { description: @talent_profile.description, user_id: @talent_profile.user_id } }
    assert_redirected_to talent_profile_url(@talent_profile)
  end

  test "should destroy talent_profile" do
    assert_difference('TalentProfile.count', -1) do
      delete talent_profile_url(@talent_profile)
    end

    assert_redirected_to talent_profiles_url
  end
end
