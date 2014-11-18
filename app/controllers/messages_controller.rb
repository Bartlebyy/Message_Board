class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(updated_at: :desc)
  end

  def new
    @user = current_user
    @message = @user.Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to @message, flash: { success: "Message was successfully created." }
    else
      render 'new', flash: { danger: "Please fill in the context field." }
    end
  end

  private

  def message_params
    params.require(:user).permit(:context)
  end
end
