class Api::UsersController < ApplicationController
  before_action :set_api_user, only: [:show, :edit, :update, :destroy]

  # GET /api/users
  # GET /api/users.json
  def index
    @api_users = Api::User.all.order('id desc')
    # render json: {status: 200, message: "All data loaded", data: @api_users}
    render json: @api_users
  end

  # GET /api/users/1
  # GET /api/users/1.json
  def show
    render json: @api_user
  end

  # GET /api/users/new
  def new
    @api_user = Api::User.new
    render json: @api_user
  end

  # GET /api/users/1/edit
  def edit
    render json: @api_user
  end

  # POST /api/users
  # POST /api/users.json
  def create
    puts "=====here"
    puts "===params==#{params['user'].inspect}==="

    @api_user = Api::User.new(api_user_params)
    
    if @api_user.save
      render json: @api_user
    else
      render json: @api_user.errors
    end
    
  end

  # PATCH/PUT /api/users/1
  # PATCH/PUT /api/users/1.json
  def update
    respond_to do |format|
      if @api_user.update(api_user_params)
        format.html { redirect_to @api_user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @api_user }
        format.json @api_user
      else
        format.html { render :edit }
        # format.json { render json: @api_user.errors, status: :unprocessable_entity }
        format.json @api_user.errors
      end
    end
  end

  # DELETE /api/users/1
  # DELETE /api/users/1.json
  def destroy
    @api_user.destroy
    render json: @api_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_user
      @api_user = Api::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_user_params
      # params.fetch(:api_user)
      params.require(:users).permit(:name,:website,:address,:phone_number,:city,:gender)
    end
end
