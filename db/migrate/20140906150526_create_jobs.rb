class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.string :location
    	t.string :company
    	t.string :email
    	
    	t.text :skills
    	t.text :description

      t.timestamps
    end
  end
end
