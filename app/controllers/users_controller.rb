class UsersController < ApplicationController

  def index
    @users = User.all.order(updated_at: :desc)
  end

  def show
    @user = user
    @messages = user.messages.order(updated_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, flash: { success: "User was successfully created." }
    else
      render 'new', flash: { danger: "Please fill in all fields with valid text." }
    end
  end


  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :employee_id)
  end
end
