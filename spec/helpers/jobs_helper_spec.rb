require 'rails_helper'

describe JobsHelper do
  describe '#salary?' do
    context 'when both of salaries are greater than zero' do
      let(:job) { build(:job) }
      it { expect(helper.salary?(job)).to be true }
    end

    context 'when only one of the salaries are greater than zero' do
      let(:job1) { build(:job, max_salary: 0) }
      let(:job2) { build(:job, min_salary: 0) }
      it { expect(helper.salary?(job1)).to be false }
      it { expect(helper.salary?(job2)).to be false }
    end
  end
end
