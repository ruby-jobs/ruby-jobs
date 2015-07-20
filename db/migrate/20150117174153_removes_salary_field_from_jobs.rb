class RemovesSalaryFieldFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :min_salary
    remove_column :jobs, :max_salary
  end
end
