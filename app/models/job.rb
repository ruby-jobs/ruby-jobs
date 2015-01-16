class Job < ActiveRecord::Base
  include Sluggable

  usar_como_dinheiro :min_salary, :max_salary

  validates :min_salary, numericality: { greater_than: 0 }, unless: 'max_salary.zero?'
  validates :max_salary, numericality: { greater_than: 0 }, unless: 'min_salary.zero?'

  validates :title, :description, :email, :company, presence: true
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }
  validates :website, format: { with: URI.regexp }, allow_blank: true

  default_scope { order(id: :desc) }
  scope :updated_at_desc, -> { order(updated_at: :desc) }

  # enumerator
  enum modality: { presencial: 0, remote: 1, freela: 2, trainee: 3 }

  def badge
    "#{modality}-badge.png"
  end

  def modality_name
    ['Presencial', 'Remoto', 'Freela', 'Trainee'][Job.modalities[modality]]
  end
end
