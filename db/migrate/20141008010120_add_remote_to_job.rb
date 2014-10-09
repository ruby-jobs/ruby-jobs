class AddRemoteToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :remote, :boolean
  end
end
