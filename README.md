
# login\_with\_github

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'login_with_github'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install login_with_github
    
    
Generate config file

	$ bundle exec login_with_github:g

## Creating your credentials

Create your app and get your credentials

[https://github.com/settings/applications/new](https://github.com/settings/applications/new)

#### Add credentials and redirect_uri to env

```
export GH_CLIENT_ID='client_id'
export GH_CLIENT_SECRET='client_secret'
export GH_REDIRECT_URI='http://localhost:3000/callback'
```

## Usage

#### Url to login

```ruby
LoginWithGithub::Api.url_in
```

#### Url to login with helper

```ruby
gh_url_in
```


#### Process callback

Get auth return `{"access_token"=>["?"], "scope"=>["user:email"], "token_type"=>["bearer"]}`

```ruby
@auth = LoginWithGithub::Api.auth code: params[:code]
```

Get user info return keys `login id node_id avatar_url gravatar_id url html_url followers_url following_url gists_url starred_url subscriptions_url organizations_url repos_url events_url received_events_url type site_admin name company blog location email hireable bio twitter_username public_repos public_gists followers following created_at updated_at`

```ruby
@info = LoginWithGithub::Api.info token: @auth['access_token'][0]
```
