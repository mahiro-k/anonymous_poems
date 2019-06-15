require 'test_helper'

class PoemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get poem_index_url
    assert_response :success
  end

end
