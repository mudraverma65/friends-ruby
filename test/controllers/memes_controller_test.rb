require "test_helper"

class MemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memes_index_url
    assert_response :success
  end
end
