require_relative "lib/testerhome/edu/version"

Gem::Specification.new do |spec|
  spec.name        = "testerhome-edu"
  spec.version     = Testerhome::Edu::VERSION
  spec.authors     = ["zhanglihua"]
  spec.email       = ["lihuazhang@hotmail.com"]
  spec.homepage    = "https://testerhome.com"
  spec.summary     = "Testerhome::Edu."
  spec.description = "Testerhome::Edu."
  spec.license     = "MIT"


  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.add_dependency "rails", "~> 6", '>= 5'
end
