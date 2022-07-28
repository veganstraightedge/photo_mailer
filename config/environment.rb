# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Removes div.form_with_errors wrapper around form fields with validation errors
#   because that breaks CSS styles, namely expected Bootstrap .classes nesting
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
