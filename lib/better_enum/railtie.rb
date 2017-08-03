module BetterEnum
  class Railtie < Rails::Railtie
    initializer 'better_enum.configure_rails_initialization' do
      ActiveSupport.on_load(:active_record) { singleton_class.prepend Extension }
    end
  end
end
