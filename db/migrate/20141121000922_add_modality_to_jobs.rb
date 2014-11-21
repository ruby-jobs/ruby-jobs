class AddModalityToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :modality, :integer, default: 0, index: true

    Job.all.each do |job|
      job.update(modality: job.remote? ? 1 : 0)
    end
    remove_column :jobs, :remote
  end

end
