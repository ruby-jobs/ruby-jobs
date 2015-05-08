Rails.env.on(:production) do |config|
  config.log_level = :info

  GA.tracker = 'UA-54767621-1'
end
