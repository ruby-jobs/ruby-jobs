namespace :db do
  desc 'Delete from database jobs that are older than 1 month'
  task :clean_old_jobs => :environment do
    jobs = get_old_jobs

    if jobs.empty?
      puts "System has no old jobs. Exiting."
    else
      puts "Number of old job(s) to be deleted: #{jobs.count}."
      puts 'Deleting...'
      jobs.delete_all

      jobs = get_old_jobs
      puts "Remaining old job(s): #{jobs.count}."
    end
  end
end

def get_old_jobs
  Job.where('created_at < ?', 1.month.ago)
end
