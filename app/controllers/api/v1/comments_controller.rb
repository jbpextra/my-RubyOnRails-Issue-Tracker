class Api::V1::CommentsController < ApplicationController
  before_action :set_api_v1_comment, only: [:show, :edit, :update, :destroy]
  swagger_controller :comments, "Comments Management"

  # GET /api/v1/comments
  # GET /api/v1/comments.json
  def index
    @api_v1_comments = Api::V1::Comment.all
  end

  # GET /api/v1/comments/1
  # GET /api/v1/comments/1.json
  def show
  end

  # GET /api/v1/comments/new
  def new
    @api_v1_comment = Api::V1::Comment.new
  end

  # GET /api/v1/comments/1/edit
  def edit
  end

  # POST /api/v1/comments
  # POST /api/v1/comments.json
  def create
    @api_v1_comment = Api::V1::Comment.new(api_v1_comment_params)

    respond_to do |format|
      if @api_v1_comment.save
        format.html { redirect_to @api_v1_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_comment }
      else
        format.html { render :new }
        format.json { render json: @api_v1_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/comments/1
  # PATCH/PUT /api/v1/comments/1.json
  def update
    respond_to do |format|
      if @api_v1_comment.update(api_v1_comment_params)
        format.html { redirect_to @api_v1_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_comment }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/comments/1
  # DELETE /api/v1/comments/1.json
  def destroy
    @api_v1_comment.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_comment
      @api_v1_comment = Api::V1::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_comment_params
      params.fetch(:api_v1_comment, {})
    end
end
