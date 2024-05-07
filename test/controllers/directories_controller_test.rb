require "test_helper"

class DirectoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get directories_index_url
    assert_response :success
  end

  test "should get new" do
    get directories_new_url
    assert_response :success
  end

  test "should get create" do
    get directories_create_url
    assert_response :success
  end

  test "should get edit" do
    get directories_edit_url
    assert_response :success
  end

  test "should get update" do
    get directories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get directories_destroy_url
    assert_response :success
  end
end
