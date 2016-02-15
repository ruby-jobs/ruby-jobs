require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'validations' do
    context 'presence_of' do
      it { expect(subject).to validate_presence_of(:email) }
      it { expect(subject).to validate_presence_of(:password) }
      it { expect(subject).to validate_presence_of(:name) }
    end
  end
  
  context 'when user is valid' do
    subject(:user) { build(:user) }
    it { expect(user).to be_valid }
  end

  context 'when user is not valid' do
    subject(:user) { build(:user, email: nil) }
    it { expect(user).not_to be_valid }
  end
end
