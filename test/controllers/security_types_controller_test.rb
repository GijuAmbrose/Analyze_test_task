require 'test_helper'

class SecurityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_type = security_types(:one)
  end

  test "should get index" do
    get security_types_url
    assert_response :success
  end

  test "should get new" do
    get new_security_type_url
    assert_response :success
  end

  test "should create security_type" do
    assert_difference('SecurityType.count') do
      post security_types_url, params: { security_type: { security_type_name: @security_type.security_type_name } }
    end

    assert_redirected_to security_type_url(SecurityType.last)
  end

  test "should show security_type" do
    get security_type_url(@security_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_security_type_url(@security_type)
    assert_response :success
  end

  test "should update security_type" do
    patch security_type_url(@security_type), params: { security_type: { security_type_name: @security_type.security_type_name } }
    assert_redirected_to security_type_url(@security_type)
  end

  test "should destroy security_type" do
    assert_difference('SecurityType.count', -1) do
      delete security_type_url(@security_type)
    end

    assert_redirected_to security_types_url
  end
end
