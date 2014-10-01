class HomeController < ApplicationController
  def index
    @jobs = Job.order('Id DESC').page(params[:page]).per(6)
  end
end
