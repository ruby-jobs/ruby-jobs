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
      it { expect(subject).to allow_value('http://www.site.com').for(:url) }
      it { expect(subject).not_to allow_value('site.com').for(:url) }
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

  describe '#badge' do
    subject(:job) do
      build(:job, modality: modality).badge
    end

    modalies = Job.modalities.keys

    modalies.each_with_index do |modality, index|
      context "when modality is #{modality}" do
        let(:modality) { index }

        it { expect(job).to eq "#{modality}-badge.png" }
      end
    end
  end

  describe '#modality_name' do
    subject(:job) do
      build(:job, modality: modality).modality_name
    end

    context 'Class work' do
      let(:modality) { 0 }

      it { is_expected.to eq 'Presencial' }
    end

    context 'Remote' do
      let(:modality) { 1 }

      it { is_expected.to eq 'Remoto' }
    end

    context 'Freelancer' do
      let(:modality) { 2 }

      it { is_expected.to eq 'Freela' }
    end

    context 'Trainee' do
      let(:modality) { 3 }

      it { is_expected.to eq 'Trainee' }
    end
  end

  describe '#salary_label' do
    subject(:job) do
      build(:job, salary: salary).salary_label
    end

    salaries = [
      { name: 'Undefined', label: 'N/A' },
      { name: 'Intern', label: 'Abaixo de R$3.000' },
      { name: 'Junior', label: 'R$3.000 - R$6.000' },
      { name: 'Medium', label: 'R$6.000 - R$9.000' },
      { name: 'Senior', label: 'Acima de R$9.000' }
    ]

    salaries.each_with_index do |item, index|
      context "#{item[:name]}" do
        let(:salary) { index }

        it { is_expected.to eq item[:label] }
      end
    end
  end

  describe '#contract_type_label' do
    subject(:job) do
      build(:job, contract_type: contract_type).contract_type_label
    end

    context 'Not Speficied' do
      let(:contract_type) { 0 }

      it { is_expected.to eq 'Não Especificado' }
    end

    context 'CLT' do
      let(:contract_type) { 1 }

      it { is_expected.to eq 'CLT' }
    end

    context 'PJ' do
      let(:contract_type) { 2 }

      it { is_expected.to eq 'PJ' }
    end
  end
end
