class HomeController < ApplicationController

  def index
    @jobs = Job.first(5)
  end

end
