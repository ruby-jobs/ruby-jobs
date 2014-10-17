10.times do |index|

  Job.create! title: "Job ##{index}", location: "Location ##{index}",
              company: "Company ##{index}", email: "email#{index}@email.com",
              description: "Description ##{index}", remote: (index.odd? ? true : false)

end
