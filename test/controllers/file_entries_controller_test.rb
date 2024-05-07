require "test_helper"

class FileEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_entries_index_url
    assert_response :success
  end

  test "should get new" do
    get file_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get file_entries_create_url
    assert_response :success
  end

  test "should get edit" do
    get file_entries_edit_url
    assert_response :success
  end

  test "should get update" do
    get file_entries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get file_entries_destroy_url
    assert_response :success
  end

  test "should get download" do
    get file_entries_download_url
    assert_response :success
  end

  test "should get share" do
    get file_entries_share_url
    assert_response :success
  end
end
