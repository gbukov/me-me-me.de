require "test_helper"

class ModeratorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = FactoryBot.create(:user_f)
    @admin = FactoryBot.create(:admin)
    @moderator = FactoryBot.create(:moderator)
  end

  test "should get index - admin" do
    sign_in @admin
    get "/moderators"
    assert_response :success
  end


  test "should get index - moderator" do
    sign_in @moderator
    get "/moderators"
    assert_response :success
  end

  test "should NOT get index - user" do
    sign_in @user
    get "/moderators"
    assert_response :redirect
    assert_redirected_to root_path
  end
end