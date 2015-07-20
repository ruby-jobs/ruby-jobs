class AddsSalaryFieldToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :salary, :integer, default: 0, index: true
  end
end
