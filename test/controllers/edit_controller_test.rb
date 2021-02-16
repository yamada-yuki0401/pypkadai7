require 'test_helper'

class EditControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get edit_destroy_url
    assert_response :success
  end

end
