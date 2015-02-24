class JobsController < ApplicationController
  def index
    @jobs = Job.actives.page(params[:page]).per(4)
    @jobs.actives.where!('modality = ?', Job.modalities[params[:modality]]) unless params[:modality].blank?

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
    raise Errors::JobExpirated if @job.created_at <= Date.today-3.months
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = 'Rubyjobs'

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
      :title,
      :email,
      :url,
      :company,
      :skills,
      :location,
      :description,
      :modality,
      :website,
      :salary)
  end
end
