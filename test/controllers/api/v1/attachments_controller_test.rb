require 'test_helper'

class Api::V1::AttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_attachment = api_v1_attachments(:one)
  end

  test "should get index" do
    get api_v1_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_attachment_url
    assert_response :success
  end

  test "should create api_v1_attachment" do
    assert_difference('Api::V1::Attachment.count') do
      post api_v1_attachments_url, params: { api_v1_attachment: {  } }
    end

    assert_redirected_to api_v1_attachment_url(Api::V1::Attachment.last)
  end

  test "should show api_v1_attachment" do
    get api_v1_attachment_url(@api_v1_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_attachment_url(@api_v1_attachment)
    assert_response :success
  end

  test "should update api_v1_attachment" do
    patch api_v1_attachment_url(@api_v1_attachment), params: { api_v1_attachment: {  } }
    assert_redirected_to api_v1_attachment_url(@api_v1_attachment)
  end

  test "should destroy api_v1_attachment" do
    assert_difference('Api::V1::Attachment.count', -1) do
      delete api_v1_attachment_url(@api_v1_attachment)
    end

    assert_redirected_to api_v1_attachments_url
  end
end
