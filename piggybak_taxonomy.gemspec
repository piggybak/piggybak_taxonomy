$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "piggybak_taxonomy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "piggybak_taxonomy"
  s.version     = PiggybakTaxonomy::VERSION
  s.authors     = ["Steph Skardal"]
  s.email       = ["steph@endpoint.com"]
  s.homepage    = "http://www.piggybak.org/"
  s.summary     = "Piggybak Taxonomy - navigation support for Piggybak."
  s.description = "Piggybak Taxonomy - navigation support for Piggybak."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.add_dependency "ancestry"
  s.add_dependency "piggybak_rails_admin_nestable", "0.0.6"
end
