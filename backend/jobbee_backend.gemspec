# encoding: UTF-8
version = File.read(File.expand_path("../../JOBBEE_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jobbee_backend"
  s.version     = version
  s.authors     = ["Surya Raj Tripathi"]
  s.email       = ["surya@rajtripathi.com"]
  s.homepage    = "https://github.com/suryart/jobbee"
  s.summary     = "Admin facing framework of jobbee"
  s.description = "Admin facing framework of jobbee and dependent on jobbee"

  s.files        = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'jobbee_core', version

  s.add_dependency 'jquery-rails', '~> 3.0.0'
  s.add_dependency 'jquery-ui-rails', '~> 4.0.0'
  s.add_dependency 'select2-rails', '~> 3.4.7'

  s.add_development_dependency 'email_spec', '~> 1.2.1'
end
