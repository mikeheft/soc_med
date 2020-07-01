$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "soc_med/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "soc_med"
  spec.version     = SocMed::VERSION
  spec.authors     = ["Mike Heft"]
  spec.email       = ["mikeheft@gmail.com"]
  spec.homepage    = "https://github.com/mikeyduece/soc_med"
  spec.summary     = "Provides social media functionality to Rails applications"
  spec.description = "Gives the abillity to create likes, follows, blocks, and reporting for Rails applications."
  spec.license     = "MIT"
  spec.post_install_message = %q{
    Post Installation Steps:
      1. Copy migrations with 'rails soc_med:install:migrations'
      2. Include relevant modules in classes you wish to take advantage of the engine.
  }

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.1"
  spec.add_dependency 'dry_serialization'
  spec.add_dependency 'blueprinter'
  spec.add_dependency 'activerecord'

  spec.add_development_dependency "sqlite3"
end
