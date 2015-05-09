require 'rails_helper'

describe JobsController do
  describe 'GET index' do
    it 'sets the @jobs variable' do
      job1 = Fabricate(:job)
      job2 = Fabricate(:job)
      get :index
      expect(assigns :jobs).to match_array([job1, job2])
    end
  end

  describe 'GET new' do
    it 'sets the @job variable' do
      get :new
      expect(assigns :job).to be_instance_of(Job)
    end
  end

  describe 'POST create' do
    context 'valid inputs' do
      let(:cool_job) { Fabricate.attributes_for(:job, title: 'Cool') }
      before { post :create, job: cool_job }
      it { expect(Job.count).to eq(1) }
      it { expect(response).to redirect_to "/jobs/#{assigns(:job).id}-cool" }
    end
    context 'invalid inputs' do
      let(:bad_job) { Fabricate.attributes_for(:job, title: '') }
      before { post :create, job: bad_job }
      it { expect(Job.count).to eq(0) }
      it { expect(response).to render_template 'jobs/new' }
    end
  end

  describe 'GET show' do
    it 'sets the @job variable' do
      job = Fabricate(:job)
      get :show, id: job.id
      expect(assigns :job).to eq(job)
    end
  end
end
