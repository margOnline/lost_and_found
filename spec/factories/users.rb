FactoryGirl.define do
  sequence(:username) { |n| "user-#{n}" }

  factory :user do
    email    { |u| "#{FactoryGirl.generate(:username)}@example.com" }
    password 'password'

    trait :admin do
      admin true
    end

  end
end
