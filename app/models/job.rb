class Job < ActiveRecord::Base
	validates_presence_of :title, :description, :email, :company
end
