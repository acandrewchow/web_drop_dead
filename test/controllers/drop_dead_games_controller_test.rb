require "test_helper"

class DropDeadGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drop_dead_games_new_url
    assert_response :success
  end

  test "should get play" do
    get drop_dead_games_play_url
    assert_response :success
  end
end
