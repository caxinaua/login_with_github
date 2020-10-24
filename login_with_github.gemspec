# frozen_string_literal: true

require_relative 'lib/login_with_github/version'

Gem::Specification.new do |spec|
  spec.name          = 'login_with_github'
  spec.version       = LoginWithGithub::VERSION
  spec.authors       = ['thiaguerd']
  spec.email         = ['mail@thiago.pro']

  spec.summary       = 'Login with github'
  spec.description   = 'Add login with github on your app'
  spec.homepage      = 'https://github.com/caxinaua/login_with_github'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/caxinaua/login_with_github'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rake', '~> 12.0'
end
