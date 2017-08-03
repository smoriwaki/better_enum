$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'better_enum/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'better_enum'
  s.version     = BetterEnum::VERSION
  s.authors     = ['smoriwaki']
  s.email       = ['smoriwaki@cuon.co.jp']
  s.homepage    = 'https://github.com/smoriwaki/better_enum'
  s.summary     = 'Slightly extension of builtin enum.'
  s.description = 'Sligntly extension of builtin enum.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 4.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end
