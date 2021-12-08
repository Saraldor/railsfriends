require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get inidex" do
    get home_inidex_url
    assert_response :success
  end
end
