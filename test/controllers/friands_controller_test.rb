require "test_helper"

class FriandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friand = friands(:one)
  end

  test "should get index" do
    get friands_url
    assert_response :success
  end

  test "should get new" do
    get new_friand_url
    assert_response :success
  end

  test "should create friand" do
    assert_difference('Friand.count') do
      post friands_url, params: { friand: { email: @friand.email, facebook: @friand.facebook, first_name: @friand.first_name, last_name: @friand.last_name, phone: @friand.phone } }
    end

    assert_redirected_to friand_url(Friand.last)
  end

  test "should show friand" do
    get friand_url(@friand)
    assert_response :success
  end

  test "should get edit" do
    get edit_friand_url(@friand)
    assert_response :success
  end

  test "should update friand" do
    patch friand_url(@friand), params: { friand: { email: @friand.email, facebook: @friand.facebook, first_name: @friand.first_name, last_name: @friand.last_name, phone: @friand.phone } }
    assert_redirected_to friand_url(@friand)
  end

  test "should destroy friand" do
    assert_difference('Friand.count', -1) do
      delete friand_url(@friand)
    end

    assert_redirected_to friands_url
  end
end
