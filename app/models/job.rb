class Job < ActiveRecord::Base
  include Sluggable

  delegate :badge, :modality_name, :salary_label, :contract_type_label, to: :decorate

  validates :title, :description, :email, :company, presence: true
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }
  validates :website, :url, format: { with: URI.regexp }, allow_blank: true

  default_scope { order(id: :desc) }
  scope :updated_at_desc, -> { order(updated_at: :desc) }

  # enumerator
  enum modality: { presencial: 0, remote: 1, freela: 2, trainee: 3 }
  enum salary: { undefined: 0, intern: 1, junior: 2, medium: 3, senior: 4 }
  enum contract_type: { not_specified: 0, clt: 1, pj: 2 }

  def decorate
    @decorate ||= JobPresenter.new(self)
  end
end
