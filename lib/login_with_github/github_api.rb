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

      def auth(options)
        CGI.parse http_post({
                              uri: URI(LoginWithGithub.config['url']['auth']),
                              head: { 'content-type' => 'application/json' },
                              body: {
                                client_id: LoginWithGithub.config['app']['client_id'],
                                client_secret: LoginWithGithub.config['app']['client_secret'],
                                code: options[:code]
                              }.to_json
                            })
      end

      def info(options)
        JSON.parse http_get({
                              uri: URI(LoginWithGithub.config['url']['info']),
                              head: { Authorization: "token #{options[:token]}" }
                            })
      end

      private

      def redirect_uri
        LoginWithGithub.config['url']['callback']
      end

      def login_params
        params = LoginWithGithub.config['url']['params_login']
        return params.to_query if params.respond_to?(:to_query)

        params.collect { |k, v| "#{k}=#{v}" }.join('&')
      end
    end
  end
end
