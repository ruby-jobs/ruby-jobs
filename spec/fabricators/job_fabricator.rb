Fabricator(:job) do
  title { Faker::Lorem.words(3).join(' ') }
  description { Faker::Lorem.paragraph(2) }
  email { Faker::Internet.email }
  company { Faker::Company.name }
  website { Faker::Internet.url }
end
