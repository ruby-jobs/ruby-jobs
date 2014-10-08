class Job < ActiveRecord::Base
  validates :title, :description, :email, :company, presence: true
  validates_inclusion_of :remote, :in => [true, false]
end
