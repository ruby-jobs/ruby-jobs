module Sluggable
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true, on: :update
    after_save :generate_slug, if: :slug_must_change?

    def to_param
      "#{id}-#{title.parameterize}"
    end
  end

  private

  def slug_must_change?
    slug != to_param
  end

  def generate_slug
    self.slug = to_param
  end
end
