require 'faker'

FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { Faker::Internet.password(8) }
    sequence(:name) { Faker::Name.name }
  end
end
