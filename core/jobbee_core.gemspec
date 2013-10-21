# encoding: UTF-8
version = File.read(File.expand_path("../../JOBBEE_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jobbee_core"
  s.version     = version
  s.summary     = "The bare bones necessary for Jobbee"
  s.description = "The bare bones necessary for Jobbee"

  s.required_ruby_version = '>= 1.9.3'
  s.authors     = ["Surya Raj tripathi"]
  s.email       = ["surya@rajtripathi.com"]
  s.homepage    = "https://github.com/suryart/jobbee"
  s.license     = %q{MIT}

  s.files       = Dir['README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.require_path = 'lib'

  s.add_dependency 'activemerchant', '1.40.0'
  s.add_dependency 'acts_as_list', '= 0.2.0'
  s.add_dependency 'awesome_nested_set', '~> 3.0.0.rc.2'
  s.add_dependency 'aws-sdk', '1.11.1'
  s.add_dependency 'cancan', '~> 1.6.10'
  s.add_dependency 'deface', '~> 1.0.0'
  s.add_dependency 'ffaker', '~> 1.16'
  s.add_dependency 'highline', '~> 1.6.18' # Necessary for the install generator
  s.add_dependency 'httparty', '~> 0.11' # For checking alerts.
  s.add_dependency 'json', '~> 1.7'
  s.add_dependency 'kaminari', '~> 0.14.1'
  s.add_dependency 'money', '~> 5.1.1'
  s.add_dependency 'paperclip', '~> 3.4.1'
  s.add_dependency 'paranoia', '~> 2.0'
  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'ransack', '1.0.0'
  s.add_dependency 'state_machine', '1.2.0'
  s.add_dependency 'stringex', '~> 1.5.1'
  s.add_dependency 'truncate_html', '0.9.2'

  s.add_development_dependency "sqlite3"

end
