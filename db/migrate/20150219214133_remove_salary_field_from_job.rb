class RemoveSalaryFieldFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :salary
  end
end
