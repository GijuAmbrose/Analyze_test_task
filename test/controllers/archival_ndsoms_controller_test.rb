require 'test_helper'

class ArchivalNdsomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archival_ndsom = archival_ndsoms(:one)
  end

  test "should get index" do
    get archival_ndsoms_url
    assert_response :success
  end

  test "should get new" do
    get new_archival_ndsom_url
    assert_response :success
  end

  test "should create archival_ndsom" do
    assert_difference('ArchivalNdsom.count') do
      post archival_ndsoms_url, params: { archival_ndsom: {  } }
    end

    assert_redirected_to archival_ndsom_url(ArchivalNdsom.last)
  end

  test "should show archival_ndsom" do
    get archival_ndsom_url(@archival_ndsom)
    assert_response :success
  end

  test "should get edit" do
    get edit_archival_ndsom_url(@archival_ndsom)
    assert_response :success
  end

  test "should update archival_ndsom" do
    patch archival_ndsom_url(@archival_ndsom), params: { archival_ndsom: {  } }
    assert_redirected_to archival_ndsom_url(@archival_ndsom)
  end

  test "should destroy archival_ndsom" do
    assert_difference('ArchivalNdsom.count', -1) do
      delete archival_ndsom_url(@archival_ndsom)
    end

    assert_redirected_to archival_ndsoms_url
  end
end
