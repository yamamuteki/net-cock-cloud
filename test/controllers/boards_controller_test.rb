require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boards_index_url
    assert_response :success
  end

  test "should get show" do
    get boards_show_url
    assert_response :success
  end

end
