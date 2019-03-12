require 'test_helper'

class TitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get titles_main_url
    assert_response :success
  end

  test "should get create" do
    get titles_create_url
    assert_response :success
  end

end
