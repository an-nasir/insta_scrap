require 'test_helper'

class WebSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_setting = web_settings(:one)
  end

  test "should get index" do
    get web_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_web_setting_url
    assert_response :success
  end

  test "should create web_setting" do
    assert_difference('WebSetting.count') do
      post web_settings_url, params: { web_setting: { post_max: @web_setting.post_max, post_min: @web_setting.post_min } }
    end

    assert_redirected_to web_setting_url(WebSetting.last)
  end

  test "should show web_setting" do
    get web_setting_url(@web_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_web_setting_url(@web_setting)
    assert_response :success
  end

  test "should update web_setting" do
    patch web_setting_url(@web_setting), params: { web_setting: { post_max: @web_setting.post_max, post_min: @web_setting.post_min } }
    assert_redirected_to web_setting_url(@web_setting)
  end

  test "should destroy web_setting" do
    assert_difference('WebSetting.count', -1) do
      delete web_setting_url(@web_setting)
    end

    assert_redirected_to web_settings_url
  end
end
