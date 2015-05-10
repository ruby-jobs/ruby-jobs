class JobsController < ApplicationController
  def index
    @jobs = JobPresenter.wrap(Job.page(params[:page]).per(4))
    @jobs.where!('modality = ?', Job.modalities[params[:modality]]) unless params[:modality].blank?
    respond_with @jobs
  end

  def new
    @job = Job.new
    respond_with @job
  end

  def create
    @job = Job.new(job_params)
    @job.save
    respond_with @job
  end

  def show
    @job = JobPresenter.new(Job.find(params[:id]))
    respond_with @job
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = 'Ruby Jobs'

    # the news items
    @job =  Job.updated_at_desc

    # this will be our Feed's update timestamp
    @updated = @job.first.updated_at unless
    @job.empty?

    respond_to do |format|
      format.atom { render layout: false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(format: :atom), status: :moved_permanently }
    end
  end

  private

  def job_params
    params.require(:job).permit(
      :title, :email, :url, :company, :skills, :location, :description,
      :modality, :website, :contract_type, :salary)
  end
end
