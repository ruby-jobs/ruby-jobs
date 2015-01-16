class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :min_salary, :decimal, precision: 14, scale: 2, default: 0.0
    add_column :jobs, :max_salary, :decimal, precision: 14, scale: 2, default: 0.0
  end
end
