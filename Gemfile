source "https://rubygems.org"

ruby "3.1.2"

# App server
gem "rails"

# Web server
gem "puma"
gem "bootsnap", require: false

# Database
gem "pg"

# Cache server
gem "redis"

# Auth
gem "bcrypt"

# Uploads
gem "image_processing"

# Assets
gem "sprockets-rails" # CSS
gem "sassc-rails"     # SCSS / CSS
gem "importmap-rails" # JS with ESM import maps
gem "turbo-rails"     # Partial page reloads
gem "stimulus-rails"  # AJAX JS
gem "jbuilder"        # JSON views

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
