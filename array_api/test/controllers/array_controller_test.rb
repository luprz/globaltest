require 'test_helper'

class ArrayControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get array_create_url
    assert_response :success
  end

  test "should get show" do
    get array_show_url
    assert_response :success
  end

end
