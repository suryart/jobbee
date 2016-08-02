# encoding: UTF-8
version = File.read(File.expand_path("../../JOBBEE_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jobbee_frontend"
  s.version     = version
  s.summary     = "The user facing entity of Jobbee"
  s.description = "The user facing entity of Jobbee"

  s.required_ruby_version = '>= 1.9.3'
  s.authors     = ["Surya Tripathi"]
  s.email       = ["surya@rajtripathi.com"]
  s.homepage    = "https://github.com/suryart/jobbee"
  s.license     = %q{MIT}

  s.files       = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'jobbee_core', version
  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
