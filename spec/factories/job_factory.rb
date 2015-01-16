FactoryGirl.define do
  factory :job, class: Job do
    title 'Title'
    location 'Location'
    company 'Company'
    sequence(:email) { |n| "email#{n}@email.com" }
    description 'Description'
    slug 'slug'
    min_salary 1000
    max_salary 2000
  end
end
