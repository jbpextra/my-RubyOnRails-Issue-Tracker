class Api::V1::UsersController < ApplicationController
  before_action :set_api_v1_user, only: [:show, :edit, :update, :destroy]
  swagger_controller :users, 'User Management'
  # GET /api/v1/users
  # GET /api/v1/users.json
  def index
    @api_v1_users = Api::V1::User.all
  end

  # GET /api/v1/users/1
  # GET /api/v1/users/1.json
  def show
  end

  # GET /api/v1/users/new
  def new
    @api_v1_user = Api::V1::User.new
  end

  # GET /api/v1/users/1/edit
  def edit
  end

  swagger_api :create do
    summary 'To create user'
    notes 'Implementation notes, such as required params, example queries for apis are written here.'
    param :form, 'user[name]', :string, :required, 'Name of user'
    response :success
    response :unprocessable_entity
    response 500, 'Internal Error'
  end
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  # PATCH/PUT /api/v1/users/1.json
  def update
    respond_to do |format|
      if @api_v1_user.update(api_v1_user_params)
        format.html { redirect_to @api_v1_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_user }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/users/1
  # DELETE /api/v1/users/1.json
  def destroy
    @api_v1_user.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user
      @api_v1_user = Api::V1::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_user_params
      params.fetch(:api_v1_user, {})
    end
end
