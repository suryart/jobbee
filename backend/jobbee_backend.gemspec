# encoding: UTF-8
version = File.read(File.expand_path("../../JOBBEE_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jobbee_backend"
  s.version     = version
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of JobbeeBackend."
  s.description = "TODO: Description of JobbeeBackend."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
