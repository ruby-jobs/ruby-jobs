require 'rails_helper'

describe Job do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:company) }

  context 'when job is valid' do
    let(:job) { FactoryGirl.build(:job) }
    it 'return true' do
      expect(job).to be_valid
    end
  end
end
