module Rack
  class DomainRedirect
    # subdomain (optional), path prefix (optional), URL regex to match (required)
    REDIRECT_CONFIGS = [
      { subdomain: '', path_prefix: '', url_regex: /photo-mailer.herokuapp.com$/ }
    ].freeze

    PROTOCOL = 'https://'.freeze
    DOMAIN   = 'usephotomailer.com'.freeze

    def initialize app
      @app = app
    end

    def call env
      request = Rack::Request.new env

      REDIRECT_CONFIGS.each do |config|
        subdomain   = config[:subdomain]
        path_prefix = config[:path_prefix]
        url_regex   = config[:url_regex]
        path        = path_prefix + request.path

        if url_regex.match? request.host.downcase
          location = redirect_location subdomain: subdomain, path: path
          return redirect location
        end
      end

      @app.call env
    end

    private

    def redirect_location path: '', subdomain: ''
      [PROTOCOL, subdomain, DOMAIN, path].join
    end

    def redirect location
      [
        301,
        { 'Location' => location, 'Content-Type' => 'text/html' },
        ['Moved Permanently']
      ]
    end
  end
end
