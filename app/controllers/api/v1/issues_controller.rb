class Api::V1::IssuesController < ApplicationController
  before_action :set_api_v1_issue, only: [:show, :edit, :update, :destroy]
  swagger_controller :issues, "Issue Management"

  def index
    issues = Issue.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'Loaded Issues', data: issues }
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])
    @attachments = @issue.attachments.paginate(page: params[:page])
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_v1_issue_params
    params.require(:issue).permit(:title, :kind, :priority, :status, :assignee, :workflow, :watch, :vote, :created)
  end
end
