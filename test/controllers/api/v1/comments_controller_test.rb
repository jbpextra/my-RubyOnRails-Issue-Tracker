require 'test_helper'

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_comment = api_v1_comments(:one)
  end

  test "should get index" do
    get api_v1_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_comment_url
    assert_response :success
  end

  test "should create api_v1_comment" do
    assert_difference('Api::V1::Comment.count') do
      post api_v1_comments_url, params: { api_v1_comment: {  } }
    end

    assert_redirected_to api_v1_comment_url(Api::V1::Comment.last)
  end

  test "should show api_v1_comment" do
    get api_v1_comment_url(@api_v1_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_comment_url(@api_v1_comment)
    assert_response :success
  end

  test "should update api_v1_comment" do
    patch api_v1_comment_url(@api_v1_comment), params: { api_v1_comment: {  } }
    assert_redirected_to api_v1_comment_url(@api_v1_comment)
  end

  test "should destroy api_v1_comment" do
    assert_difference('Api::V1::Comment.count', -1) do
      delete api_v1_comment_url(@api_v1_comment)
    end

    assert_redirected_to api_v1_comments_url
  end
end
