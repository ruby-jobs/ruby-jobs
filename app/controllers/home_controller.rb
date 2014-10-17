class HomeController < ApplicationController
  def index
    @jobs = Job.page(params[:page]).per(6)
  end
end
