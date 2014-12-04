class AddWebsiteToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :website, :string
  end
end
