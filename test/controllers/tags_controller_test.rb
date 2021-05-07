require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get '/tags/indoor'
    assert_response :success
  end
end
