require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "should get index" do
    get posts_url
    assert_response :success
  end
end
