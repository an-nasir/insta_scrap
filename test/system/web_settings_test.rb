require "application_system_test_case"

class WebSettingsTest < ApplicationSystemTestCase
  setup do
    @web_setting = web_settings(:one)
  end

  test "visiting the index" do
    visit web_settings_url
    assert_selector "h1", text: "Web Settings"
  end

  test "creating a Web setting" do
    visit web_settings_url
    click_on "New Web Setting"

    fill_in "Post Max", with: @web_setting.post_max
    fill_in "Post Min", with: @web_setting.post_min
    click_on "Create Web setting"

    assert_text "Web setting was successfully created"
    click_on "Back"
  end

  test "updating a Web setting" do
    visit web_settings_url
    click_on "Edit", match: :first

    fill_in "Post Max", with: @web_setting.post_max
    fill_in "Post Min", with: @web_setting.post_min
    click_on "Update Web setting"

    assert_text "Web setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Web setting" do
    visit web_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Web setting was successfully destroyed"
  end
end
