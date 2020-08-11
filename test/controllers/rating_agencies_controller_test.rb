require 'test_helper'

class RatingAgenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating_agency = rating_agencies(:one)
  end

  test "should get index" do
    get rating_agencies_url
    assert_response :success
  end

  test "should get new" do
    get new_rating_agency_url
    assert_response :success
  end

  test "should create rating_agency" do
    assert_difference('RatingAgency.count') do
      post rating_agencies_url, params: { rating_agency: { rating_agency_name: @rating_agency.rating_agency_name } }
    end

    assert_redirected_to rating_agency_url(RatingAgency.last)
  end

  test "should show rating_agency" do
    get rating_agency_url(@rating_agency)
    assert_response :success
  end

  test "should get edit" do
    get edit_rating_agency_url(@rating_agency)
    assert_response :success
  end

  test "should update rating_agency" do
    patch rating_agency_url(@rating_agency), params: { rating_agency: { rating_agency_name: @rating_agency.rating_agency_name } }
    assert_redirected_to rating_agency_url(@rating_agency)
  end

  test "should destroy rating_agency" do
    assert_difference('RatingAgency.count', -1) do
      delete rating_agency_url(@rating_agency)
    end

    assert_redirected_to rating_agencies_url
  end
end
