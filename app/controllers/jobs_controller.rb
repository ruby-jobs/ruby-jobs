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

	private

  def job_params
    params.require(:job).permit(:title, :email, :company, :skills, :location, :description)
  end
end
