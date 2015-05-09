10.times do |index|
  Job.create! title: "Job ##{index}", location: "Location ##{index}",
              company: "Company ##{index}", email: "email#{index}@email.com",
              description: "Description ##{index}", modality: rand(4)
end
