FactoryGirl.define do
  sequence(:username) { |n| "user-#{n}" }

  factory :user do
    email    { |u| "#{FactoryGirl.generate(:username)}@example.com" }
    password 'password'
  end
end
