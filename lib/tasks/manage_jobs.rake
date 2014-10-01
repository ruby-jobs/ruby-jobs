namespace :db do
  desc 'Delete from database jobs that are older than 1 month'
  task clean_old_jobs: :environment do
    jobs = old_jobs

    if jobs.empty?
      puts 'System has no old jobs. Exiting.'
    else
      puts 'Number of old job(s) to be deleted: #{jobs.count}.'
      puts 'Deleting...'
      jobs.delete_all

      puts 'Remaining old job(s): #{old_jobs.count}.'
    end
  end
end

def old_jobs
  Job.where('created_at < ?', 1.month.ago)
end
