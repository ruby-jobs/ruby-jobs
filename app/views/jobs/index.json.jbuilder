json.array! @jobs do |job|
  json.title job.title
  json.location job.location
  json.company job.company
  json.posted_at job.created_at.to_date
  json.modality modality(job)
  json.url job_url(job)
  json.skills job.skills
  json.description job.description
  json.badge image_path("#{modality(job).parameterize}-badge.png")
end