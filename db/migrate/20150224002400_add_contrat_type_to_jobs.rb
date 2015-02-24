class AddContratTypeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contract_type, :integer, default: 0, index: true
  end
end
