class HomeController < ApplicationController
  def index
  	@jobs = Job.all.reverse
  end
end
