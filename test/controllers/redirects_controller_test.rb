require "test_helper"

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get redirects_show_url
    assert_response :success
  end
end
