class UpdatesNilJobsLocation < ActiveRecord::Migration
  def change
  	jobs = Job.where(:remote => nil)

  	jobs.each do |job|
  	  job.update_column(:remote, false)
  	end
  end
end
