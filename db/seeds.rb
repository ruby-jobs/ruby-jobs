User.create(name: 'Ruby Jobs', email: 'ruby@jobs.me', password: 'rubyjobs')

10.times do |index|
  Job.create! title: "Job ##{index}", location: "Location ##{index}",
               company: "Company ##{index}", email: "email#{index}@email.com",
               description: "Description ##{index}", modality: rand(4), user_id: 1
end
