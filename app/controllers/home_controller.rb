class HomeController < ApplicationController
  def index
    @jobs = Job.desc.page(params[:page]).per(6)
  end
end
