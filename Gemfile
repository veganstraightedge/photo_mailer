source "https://rubygems.org"

ruby File.read('.ruby-version').chomp

# App server
gem "bootsnap", require: false
gem "rails"

# Web server
gem "puma"

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

# Views
gem "bootstrap" # Design framework
gem "jbuilder"  # JSON views
gem "kaminari"  # Pagination


group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
