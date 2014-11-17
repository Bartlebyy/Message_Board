class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(updated_at: :desc)
  end
end
