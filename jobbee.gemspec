# encoding: UTF-8
version = File.read(File.expand_path("../JOBBEE_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jobbee"
  s.version     = version
  s.summary     = "A job portal framework for Ruby on Rails."
  s.description = "Jobbee is an open source job portal framework for Ruby on Rails. Still being build and is in the process of improvements."

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.23'

  s.authors     = ["Surya Raj Tripathi"]
  s.email       = ["surya@rajtripathi.com"]
  s.homepage    = "https://github.com/suryart/jobbee"
  s.license     = %q{MIT}

  s.add_dependency 'jobbee_core', version
  s.add_dependency 'jobbee_backend', version
  s.add_dependency 'jobbee_frontend', version
end
