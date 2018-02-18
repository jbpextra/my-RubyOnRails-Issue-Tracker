class CommentsController < ApplicationController
    def create
        @issue = Issue.find(params[:issue_id])
        @comment = @issue.comments.create(params[:comment].permit(:body,:user_id))
#        @attachment = @comment.create(params[:atachment].permit(:content, :user_id, :issue_id))
        redirect_to issue_path(@issue)
    end
    
    def destroy
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.find(params[:id])
    @comment.destroy
    redirect_to issue_path(@issue)
    end
end
