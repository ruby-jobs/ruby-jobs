class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = 'Rubyjobs'

    # the news items
    @job =  Job.order('updated_at desc')

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
    params.require(:job).permit(:title, :email, :company, :skills, :location, :description)
  end
end
