class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /applications
  # GET /applications.json
  def index
    # Shut up I know this is stupid
    @users = User.all
    unless user_signed_in? and current_user.is_admin?
        redirect_to root_path, notice: "Log in first"
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
      if current_user.application == @application or current_user.is_admin?
          redirect_to user_path(@application.user)
      else
          redirect_to root_path
      end
  end

  # GET /applications/new
  def new
    @application = Application.new
    @positions = Position.all

    unless current_user.application.nil?
        redirect to application_path(current_user.application)
    end
  end

  # GET /applications/1/edit
  def edit
      redirect_to root_path unless user_signed_in? and @application == current_user.application
      @positions = Position.all
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        current_user.application = @application
        current_user.save
        format.html { redirect_to @application, notice: 'Application successfully sent in.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    unless user_signed_in? and @application == current_user.application or current_user.is_admin?
        redirect_to root_path, notice: "You can't do that dude"
    end
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:user_id, :message, :position_ids => [])
    end
end
