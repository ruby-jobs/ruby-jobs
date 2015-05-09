class HomeController < ApplicationController
  def index
    @jobs = JobPresenter.wrap(Job.first(5))
  end
end
