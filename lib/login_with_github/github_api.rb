# frozen_string_literal: true

module LoginWithGithub
  # github api
  class Api
    class << self
      include ApiBase

      def url_in
        [
          LoginWithGithub.config['url']['login'], '?',
          CGI.unescape(login_params)
        ].join
      end

      private

      def redirect_uri
        LoginWithGithub.config['url']['callback']
      end

      def login_params
        return params.to_query if params.respond_to?(:to_query)

        params.collect { |k, v| "#{k}=#{v}" }.join('&')
      end
    end
  end
end
