class AboutController < ApplicationController
  skip_before_action :authorize

  def terms; end

  def privacy; end
end
