# frozen_string_literal: true

require_relative 'lib/faraday/encode_xml/version'

Gem::Specification.new do |spec|
  spec.name = 'faraday-encode_xml'
  spec.version = Faraday::EncodeXML::VERSION
  spec.authors = ['Alexander Popov']
  spec.email = ['alex.wayfer@gmail.com']

  spec.summary = 'Faraday middleware for encoding requests as XML'
  spec.description = <<~DESC
    Faraday middleware for encoding requests as XML.
  DESC
  spec.license = 'MIT'

  github_uri = "https://github.com/AlexWayfer/#{spec.name}"

  spec.homepage = github_uri

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'bug_tracker_uri' => "#{github_uri}/issues",
    'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
    'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
    'homepage_uri' => spec.homepage,
    'source_code_uri' => github_uri,
    'wiki_uri' => "#{github_uri}/wiki"
  }

  spec.files = Dir['lib/**/*', 'README.md', 'LICENSE.md', 'CHANGELOG.md']

  spec.required_ruby_version = '>= 2.5', '< 4'

  spec.add_runtime_dependency 'faraday', '~> 1.0'
  spec.add_runtime_dependency 'gyoku', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'bundler-audit', '~> 0.9.0'

  spec.add_development_dependency 'pry-byebug', '~> 3.9'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.0'

  spec.add_development_dependency 'gem_toys', '~> 0.11.0'
  spec.add_development_dependency 'toys', '~> 0.13.0'

  spec.add_development_dependency 'rubocop', '~> 1.28.1'
  spec.add_development_dependency 'rubocop-packaging', '~> 0.5'
  spec.add_development_dependency 'rubocop-performance', '~> 1.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
end
