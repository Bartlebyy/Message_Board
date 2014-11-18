# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "john.doe@example.com"
    employee_id 100347
  end
end
