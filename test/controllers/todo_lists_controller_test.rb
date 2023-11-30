require "test_helper"

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todo_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get todo_lists_create_url
    assert_response :success
  end

  test "should get update" do
    get todo_lists_update_url
    assert_response :success
  end

  test "should get edit" do
    get todo_lists_edit_url
    assert_response :success
  end
end
