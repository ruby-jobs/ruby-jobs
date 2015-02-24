class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from Errors::JobExpirated, with: :job_expirated
    rescue_from ActiveRecord::RecordNotFound, with: :job_not_found
    rescue_from ActionController::RoutingError, with: :route_not_found
  end

  private

  def job_expirated
    render :template => "errors/index.html", layout: 'errors',  :locals => { error: :gone }
  end

  def job_not_found
    render :template => "errors/index.html", layout: 'errors',  :locals => { error: :job_not_found }
  end

  def route_not_found
    render :template => "errors/index.html", layout: 'errors',  :locals => { error: :route_not_found }
  end


end
