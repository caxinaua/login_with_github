# frozen_string_literal: true

# helper gh_url_in
module LoginWithGithubHelper
  def gh_url_in
    LoginWithGithub::Api.url_in
  end
end
