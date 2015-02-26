class IsusController < ApplicationController
  before_action :set_isu, only: [:show, :edit, :update, :destroy]

  # GET /isus
  def index
    @positions = Position.all

    redirect_to user_path(current_user) if user_signed_in?
  end
end
