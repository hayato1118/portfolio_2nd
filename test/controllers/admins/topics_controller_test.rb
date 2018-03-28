require 'test_helper'

class Admins::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_topics_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_topics_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_topics_edit_url
    assert_response :success
  end

end
