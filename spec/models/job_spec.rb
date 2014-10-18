require 'rails_helper'

describe Job do
  context 'validations' do
    context 'presence_of' do
      it { expect(subject).to validate_presence_of(:title) }
      it { expect(subject).to validate_presence_of(:description) }
      it { expect(subject).to validate_presence_of(:email) }
      it { expect(subject).to validate_presence_of(:company) }
    end

    context 'inclusion of' do
      it { expect(subject).to validate_inclusion_of(:remote).in_array([true, false]) }
    end

    context 'format_of' do
      it { expect(subject).to allow_value('me@email.com').for(:email) }
      it { expect(subject).not_to allow_value('m@e.com').for(:email) }
    end
  end

  context 'when job is valid' do
    subject(:job) { build(:job) }
    it { expect(job).to be_valid }
  end

  context 'when job is not valid' do
    subject(:job) { build(:job, email: 'm@e.com') }
    it { expect(job).not_to be_valid }
  end

  context 'when job is valid' do
    subject(:job) { build(:job) }
    it { expect(job).to be_valid }
  end

  context 'when job is not valid' do
    subject(:job) { build(:job, email: 'm@e.com') }
    it { expect(job).not_to be_valid }
  end

end
