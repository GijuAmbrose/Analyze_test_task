require 'test_helper'

class SecuritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security = securities(:one)
  end

  test "should get index" do
    get securities_url
    assert_response :success
  end

  test "should get new" do
    get new_security_url
    assert_response :success
  end

  test "should create security" do
    assert_difference('Security.count') do
      post securities_url, params: { security: { coupon_rate: @security.coupon_rate, face_value: @security.face_value, isin: @security.isin, issue_date: @security.issue_date, maturity_date: @security.maturity_date, outstanding_stock: @security.outstanding_stock, security_name: @security.security_name } }
    end

    assert_redirected_to security_url(Security.last)
  end

  test "should show security" do
    get security_url(@security)
    assert_response :success
  end

  test "should get edit" do
    get edit_security_url(@security)
    assert_response :success
  end

  test "should update security" do
    patch security_url(@security), params: { security: { coupon_rate: @security.coupon_rate, face_value: @security.face_value, isin: @security.isin, issue_date: @security.issue_date, maturity_date: @security.maturity_date, outstanding_stock: @security.outstanding_stock, security_name: @security.security_name } }
    assert_redirected_to security_url(@security)
  end

  test "should destroy security" do
    assert_difference('Security.count', -1) do
      delete security_url(@security)
    end

    assert_redirected_to securities_url
  end
end
