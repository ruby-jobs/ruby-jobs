require 'rails_helper'

shared_examples_for Sluggable do
  context 'after creating' do
    it { expect(subject.slug).to eql "#{subject.id}-desenvolvedor-back-end-ruby-on-rails-pleno" }
  end

  context 'after updating title (sensitive field)' do
    before { subject.update_attributes(title: 'analista de suporte') }

    it { expect(subject.slug).to eql "#{subject.id}-analista-de-suporte" }
  end

  context 'after updating any other non-sensitive field' do
    before { subject.update_attributes(company: 'amazon sw') }

    it { expect(subject.slug).to eql "#{subject.id}-desenvolvedor-back-end-ruby-on-rails-pleno" }
  end
end

describe Job do
  it_behaves_like Sluggable do
    subject { create(:job, title: 'desenvolvedor back-end ruby on rails pleno') }
  end
end
