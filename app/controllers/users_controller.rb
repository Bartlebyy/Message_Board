class UsersController < ApplicationController
  before_filter :valid_employee_id?, only: [:create]
  before_filter :valid_email?, only: [:create]

  def index
    @users = users.order(updated_at: :desc)
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
      flash[:success] = "User successfully created!"
    else
      render 'new'
      flash[:danger] = "Please fill in all fields."
    end
  end


private

def user
  @user ||= User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :employee_id)
end

def valid_employee_id?
  num = user.employee_id
  data = IO.readlines("employee_ids.csv")
  valid = false
  (1..6).each do |n|
    id = data[n].split(",")[0].to_i
    valid = true if num == id
  end
  valid
end

def valid_email?
  email_array = user.email.split("@")
  email_array.size == 2 && email_array[1].split(".")[1]
end

end
