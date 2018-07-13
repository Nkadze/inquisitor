# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inquisitor/version'

Gem::Specification.new do |gem|
  gem.name          = 'inquisitor'
  gem.version       = Inquisitor::VERSION
  gem.licenses      = ['MIT']
  gem.authors       = ['Niko Kasradze']
  gem.email         = ['nkadze@gmail.com']
  gem.description   = %q{Anonymization gem for Ruby on Rails}
  gem.summary       = %q{Ruby gem to handle anonymization for ActiveRecord instances.}
  gem.homepage      = 'https://github.com/nkadze/inquisitor'
  gem.required_ruby_version = '>= 2.0.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'activerecord', '>= 3.1'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'simplecov', RUBY_VERSION < '2' ? '~> 0.11.2' : '>= 0.11.2'
end
