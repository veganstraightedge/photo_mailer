ActionMailer::Base.default_url_options = {
  host: ENV.fetch('HOST'),
  port: ENV.fetch('PORT')
}.compact
