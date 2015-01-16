require 'rails_helper'

describe Job do
  context 'validations' do
    context 'presence_of' do
      it { expect(subject).to validate_presence_of(:title) }
      it { expect(subject).to validate_presence_of(:description) }
      it { expect(subject).to validate_presence_of(:email) }
      it { expect(subject).to validate_presence_of(:company) }
    end

    context 'format_of' do
      it { expect(subject).to allow_value('me@email.com').for(:email) }
      it { expect(subject).not_to allow_value('m@e.com').for(:email) }
      it { expect(subject).to allow_value('http://www.site.com').for(:website) }
      it { expect(subject).not_to allow_value('site.com').for(:website) }
    end

    context 'when max_salary isnt zero' do
      it 'not allow min_salary to be equal zero' do
        allow(subject).to receive(:max_salary) { 1000 }
        allow(subject).to receive(:min_salary) { 0 }
        expect(subject).to_not allow_value(0).for(:min_salary)
      end
    end

    context 'when min_salary isnt zero' do
      it 'not allow max_salary to be equal 0' do
        allow(subject).to receive(:min_salary) { 1000 }
        allow(subject).to receive(:max_salary) { 0 }
        expect(subject).to_not allow_value(0).for(:max_salary)
      end
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
