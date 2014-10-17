class Job < ActiveRecord::Base
  include Sluggable

  validates :title, :description, :email, :company, presence: true
  validates :remote, inclusion: { in: [true, false] }
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }

  default_scope { order(id: :desc) }
  scope :updated_at_desc, -> { order(updated_at: :desc) }
end
