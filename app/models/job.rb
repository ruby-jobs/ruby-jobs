class Job < ActiveRecord::Base
  validates :title, :description, :email, :company, presence: true
end
