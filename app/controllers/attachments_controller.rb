class AttachmentsController < ApplicationController
  before_action only: [:create, :destroy] #:logged_in_user,

  def create
    @issue = set_issue
    @attachment = @issue.attachments.create(attachment_params)
    redirect_to issue_path(@issue)
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @issue = @attachment.issue_id
    @attachment.destroy
    redirect_to issue_path(@issue), notice: 'The attachment has been deleted.'
  end

  private

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def attachment_params
    params.require(:attachment).permit(:content, :issue_id)
  end

end

