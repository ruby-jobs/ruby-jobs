class SitemapController < ApplicationController
  def index
    @jobs = Job.all
    respond_to do |format|
      format.xml
    end
  end
end
