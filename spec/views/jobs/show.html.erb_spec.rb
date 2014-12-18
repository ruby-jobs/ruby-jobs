require 'rails_helper'

describe 'jobs/show.html.erb' do
  context 'job description' do
    it 'displays the markdow as html' do
      assign :job, create(:job, description: '#Description')
      render
      expect(rendered).to have_selector('.job-description > h1')
    end
  end

  context 'skills' do
    it 'displays the markdow as html' do
      assign :job, create(:job, skills: '#Skills')
      render
      expect(rendered).to have_selector('.skills > h1')
    end
  end
end
