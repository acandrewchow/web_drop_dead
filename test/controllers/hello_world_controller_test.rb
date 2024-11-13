require "test_helper"

class HelloWorldControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get hello_world_hello_url
    assert_response :success
  end
end
