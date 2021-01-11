require 'rails/generators/base'

module SocMed
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    def self.exit_on_failure
      true
    end

    def install_soc_med_migrations
      say 'Copying migrations...'
      run 'rails soc_med:install:migrations'
    end

    def install_soc_med_initializer
      say 'Creating intializer...'
      template 'soc_med.rb', 'config/initializers/soc_med.rb'
    end

  end

end