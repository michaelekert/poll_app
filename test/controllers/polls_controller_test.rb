require "test_helper"

class PollsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get polls_index_url
    assert_response :success
  end

  test "should get show" do
    get polls_show_url
    assert_response :success
  end
end
