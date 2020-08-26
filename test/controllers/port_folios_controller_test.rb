require 'test_helper'

class PortFoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @port_folio = port_folios(:one)
  end

  test "should get index" do
    get port_folios_url
    assert_response :success
  end

  test "should get new" do
    get new_port_folio_url
    assert_response :success
  end

  test "should create port_folio" do
    assert_difference('PortFolio.count') do
      post port_folios_url, params: { port_folio: {  } }
    end

    assert_redirected_to port_folio_url(PortFolio.last)
  end

  test "should show port_folio" do
    get port_folio_url(@port_folio)
    assert_response :success
  end

  test "should get edit" do
    get edit_port_folio_url(@port_folio)
    assert_response :success
  end

  test "should update port_folio" do
    patch port_folio_url(@port_folio), params: { port_folio: {  } }
    assert_redirected_to port_folio_url(@port_folio)
  end

  test "should destroy port_folio" do
    assert_difference('PortFolio.count', -1) do
      delete port_folio_url(@port_folio)
    end

    assert_redirected_to port_folios_url
  end
end
