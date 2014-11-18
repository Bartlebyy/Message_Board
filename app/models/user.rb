require "pry"
class User < ActiveRecord::Base
  has_many :messages
  before_validation :valid_employee_id?
  validates :employee_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def valid_employee_id?
    num = employee_id
    data = IO.readlines("employee_ids.csv")
    valid = false
    (1..6).each do |n|
      id = data[n].split(",")[0].to_i
      valid = true if num == id
    end
    valid
  end
end
