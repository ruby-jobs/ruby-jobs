class Job < ActiveRecord::Base
  validates :title, :description, :email, :company, presence: true
  validates :remote, inclusion: { in: [true, false] }
end
