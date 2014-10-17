require 'rails_helper'

describe Job do
  subject { create(:job, title: 'desenvolvedor back-end ruby on rails pleno') }

  describe 'validations' do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:company) }
    it { should_not allow_value(nil).for(:remote) }
  end

  describe 'when job is valid' do
    it { expect(subject).to be_valid }
    it { expect(subject.slug).to eql "#{subject.id}-desenvolvedor-back-end-ruby-on-rails-pleno" }
  end
end
