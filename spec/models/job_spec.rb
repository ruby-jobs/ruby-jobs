require 'rails_helper'

describe Job do
  subject { create(:job) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:company) }
    it { should_not allow_value(nil).for(:remote) }
    it { should validate_presence_of(:slug).on(:update) }
  end

  describe 'when job is valid' do
    it { expect(subject).to be_valid }
  end
end
