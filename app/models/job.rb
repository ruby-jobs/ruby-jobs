class Job < ActiveRecord::Base
  validates :title, :description, :email, :company, presence: true
  validates :remote, inclusion: { in: [true, false] }
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }
end
