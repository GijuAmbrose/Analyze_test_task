require 'test_helper'

class InterestFrequenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_frequency = interest_frequencies(:one)
  end

  test "should get index" do
    get interest_frequencies_url
    assert_response :success
  end

  test "should get new" do
    get new_interest_frequency_url
    assert_response :success
  end

  test "should create interest_frequency" do
    assert_difference('InterestFrequency.count') do
      post interest_frequencies_url, params: { interest_frequency: { frequency: @interest_frequency.frequency } }
    end

    assert_redirected_to interest_frequency_url(InterestFrequency.last)
  end

  test "should show interest_frequency" do
    get interest_frequency_url(@interest_frequency)
    assert_response :success
  end

  test "should get edit" do
    get edit_interest_frequency_url(@interest_frequency)
    assert_response :success
  end

  test "should update interest_frequency" do
    patch interest_frequency_url(@interest_frequency), params: { interest_frequency: { frequency: @interest_frequency.frequency } }
    assert_redirected_to interest_frequency_url(@interest_frequency)
  end

  test "should destroy interest_frequency" do
    assert_difference('InterestFrequency.count', -1) do
      delete interest_frequency_url(@interest_frequency)
    end

    assert_redirected_to interest_frequencies_url
  end
end
