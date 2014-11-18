class Message < ActiveRecord::Base
  belongs_to :user
  before_validation :first_message_of_day
  validates :created_at, presence: true, if: :first_message_of_day?

  def first_message_of_day?
    Time.now - 1.day >= @user.Message.last.created_at
  end
end
