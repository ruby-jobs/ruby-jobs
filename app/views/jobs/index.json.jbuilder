json.array! @jobs do |job|
  json.title job.title
  json.location job.location
  json.company job.company
  json.website job.website
  json.posted_at job.created_at.to_date
  json.modality_name job.modality_name
  json.modality job.modality
  json.url job_url(job)
  json.skills job.skills
  json.description job.description
  json.badge image_path("#{job.badge}")
end
