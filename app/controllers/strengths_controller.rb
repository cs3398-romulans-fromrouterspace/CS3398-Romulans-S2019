class StrengthsController < ApplicationController
  def index
    @user = current_user
    @strengths = @user.strengths
  end

  def show
    @strength = Strength.find(params[:id])
  end
end
