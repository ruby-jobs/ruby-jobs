require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do
  describe 'GET index' do
    it 'renders jobs as a json array' do
      jobs = create_list(:job, 2)

      xhr :get, :index

      expect(response).to be_success
      expect(assigns(:jobs)).to match_array(jobs)
    end
  end

  describe 'GET show' do
    it 'renders a job as a json object' do
      job = create(:job, title: 'Awesome Job')

      xhr :get, :show, id: job.id
      json_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(json_response['title']).to eq('Awesome Job')
    end
  end
end
