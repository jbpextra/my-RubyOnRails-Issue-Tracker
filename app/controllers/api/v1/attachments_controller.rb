class Api::V1::AttachmentsController < ApplicationController
  before_action :set_api_v1_attachment, only: [:show, :edit, :update, :destroy]
  swagger_controller :attachments, "Attachments Managment"


  # GET /api/v1/attachments
  # GET /api/v1/attachments.json
  def index
    @api_v1_attachments = Api::V1::Attachment.all
  end

  # GET /api/v1/attachments/1
  # GET /api/v1/attachments/1.json
  def show
  end

  # GET /api/v1/attachments/new
  def new
    @api_v1_attachment = Api::V1::Attachment.new
  end

  # GET /api/v1/attachments/1/edit
  def edit
  end

  # POST /api/v1/attachments
  # POST /api/v1/attachments.json
  def create
    @api_v1_attachment = Api::V1::Attachment.new(api_v1_attachment_params)

    respond_to do |format|
      if @api_v1_attachment.save
        format.html { redirect_to @api_v1_attachment, notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_attachment }
      else
        format.html { render :new }
        format.json { render json: @api_v1_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/attachments/1
  # PATCH/PUT /api/v1/attachments/1.json
  def update
    respond_to do |format|
      if @api_v1_attachment.update(api_v1_attachment_params)
        format.html { redirect_to @api_v1_attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_attachment }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/attachments/1
  # DELETE /api/v1/attachments/1.json
  def destroy
    @api_v1_attachment.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_attachment
      @api_v1_attachment = Api::V1::Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_attachment_params
      params.fetch(:api_v1_attachment, {})
    end
end
