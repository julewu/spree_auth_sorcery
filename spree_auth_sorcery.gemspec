# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_auth_sorcery'
  s.version     = '3.1.0'
  s.summary     = 'Provides authentication and authorization services for use with Spree by using Sorcery and CanCan.'
  s.description = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'Bin Li'
  s.email     = 'holysoros@gmail.com'
  s.homepage  = 'http://www.spreecommerce.com'
  s.license   = %q{BSD-3}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '~> 3.1.0'

  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'sorcery', '~> 0.9.1'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'spree_backend', spree_version
  s.add_development_dependency 'spree_frontend', spree_version
  s.add_development_dependency 'sqlite3'
end
