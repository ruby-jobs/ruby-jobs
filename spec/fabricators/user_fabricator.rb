Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Internet.password(8) }
  name { Faker::Name.name }
end
