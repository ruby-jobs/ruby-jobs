FactoryGirl.define do
  factory :job, class: Job do
    title 'Title'
    location 'Location'
    company 'Company'
    email 'Email'
    description 'Description'
    remote false
  end
end
