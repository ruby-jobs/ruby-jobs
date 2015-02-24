class AddModalityToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :modality, :integer, default: 0, index: true
    remove_column :jobs, :remote
  end

end
