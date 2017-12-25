$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'data_reverse/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'data_reverse'
  s.version     = DataReverse::VERSION
  s.authors     = ['Cyril ViXP']
  s.email       = ['cyrilvixp@gmail.com']
  s.date        = '2017-12-25'
  s.summary     = 'JSON data reverse mechanism'
  s.description = 'Sample GEM for Amoniac'
  s.homepage    = 'https://github.com/ViXP/data_reverse_gem'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,test,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md'
  ]

  s.add_dependency 'rails', '~> 5'

  s.add_development_dependency 'sqlite3', '~> 0'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
end
