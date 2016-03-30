module SpreeAuthSorcery
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_auth_sorcery'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree_auth_sorcery.set_user_class", :after => :load_config_initializers do
      Spree.user_class = "Spree::User"
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      if SpreeAuthSorcery::Engine.frontend_available?
        Spree::StoreController.send :include, Spree::FrontendAuthenticationHelpers
        Spree::StoreController.send :include, Spree::CurrentUserHelpers
      end

      if SpreeAuthSorcery::Engine.backend_available?
        Spree::Admin::BaseController.send :include, Spree::BackendAuthenticationHelpers
        Spree::Admin::BaseController.send :include, Spree::CurrentUserHelpers
      end

      if SpreeAuthSorcery::Engine.api_available?
        Spree::Api::BaseController.send :include, Spree::CurrentUserHelpers
      end
    end

    def self.backend_available?
      @@backend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Backend::Engine')
    end

    def self.frontend_available?
      @@frontend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Frontend::Engine')
    end

    def self.api_available?
      @@api_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Api::Engine')
    end

    config.to_prepare &method(:activate).to_proc
  end
end
