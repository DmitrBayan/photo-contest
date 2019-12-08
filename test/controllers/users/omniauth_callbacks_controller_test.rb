require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get users_omniauth_callbacks_facebook_url
    assert_response :success
  end

  test "should get vkontakte" do
    get users_omniauth_callbacks_vkontakte_url
    assert_response :success
  end

end
