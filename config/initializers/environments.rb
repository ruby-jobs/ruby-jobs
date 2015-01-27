Rails.env.on(:production) do |config|
  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_files = false

  config.log_level = :info
end
