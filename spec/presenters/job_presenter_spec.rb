require 'rails_helper'

RSpec.describe JobPresenter do
  describe '#badge' do
    subject(:job) do
      JobPresenter.new(build(:job, modality: modality)).badge
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
      JobPresenter.new(build(:job, modality: modality)).modality_name
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
      JobPresenter.new(build(:job, salary: salary)).salary_label
    end

    salaries = [
      { name: 'Undefined', label: 'N/A' },
      { name: 'Intern', label: 'Abaixo de R$3.000' },
      { name: 'Junior', label: 'R$3.000 - R$6.000' },
      { name: 'Medium', label: 'R$6.000 - R$9.000' },
      { name: 'Senior', label: 'Acima de R$9.000' },
      { name: 'Value by Hour', label: 'Valor hora a combinar' }
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
      JobPresenter.new(build(:job, contract_type: contract_type)).contract_type_label
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
