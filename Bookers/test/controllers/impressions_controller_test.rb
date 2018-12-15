require 'test_helper'

class ImpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get impressions_top_url
    assert_response :success
  end

  test "should get index" do
    get impressions_index_url
    assert_response :success
  end

  test "should get new" do
    get impressions_new_url
    assert_response :success
  end

  test "should get edit" do
    get impressions_edit_url
    assert_response :success
  end

  test "should get show" do
    get impressions_show_url
    assert_response :success
  end

end
