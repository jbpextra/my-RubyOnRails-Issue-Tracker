require 'test_helper'

class Api::V1::IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_issue = api_v1_issues(:one)
  end

  test "should get index" do
    get api_v1_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_issue_url
    assert_response :success
  end

  test "should create api_v1_issue" do
    assert_difference('Api::V1::Issue.count') do
      post api_v1_issues_url, params: { api_v1_issue: {  } }
    end

    assert_redirected_to api_v1_issue_url(Api::V1::Issue.last)
  end

  test "should show api_v1_issue" do
    get api_v1_issue_url(@api_v1_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_issue_url(@api_v1_issue)
    assert_response :success
  end

  test "should update api_v1_issue" do
    patch api_v1_issue_url(@api_v1_issue), params: { api_v1_issue: {  } }
    assert_redirected_to api_v1_issue_url(@api_v1_issue)
  end

  test "should destroy api_v1_issue" do
    assert_difference('Api::V1::Issue.count', -1) do
      delete api_v1_issue_url(@api_v1_issue)
    end

    assert_redirected_to api_v1_issues_url
  end
end
