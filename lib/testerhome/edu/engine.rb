module Testerhome
  module Edu
    class Engine < ::Rails::Engine
      isolate_namespace Testerhome::Edu

      initializer 'testerhome.edu.init' do |app|
        if Setting.has_module?(:testerhome_edu)
          app.config.after_initialize do
            # Because need use I18n.t
            # must after Rails application initialized will get correct locale
            Homeland.register_plugin do |plugin|
              plugin.name              = 'edu'
              plugin.display_name      = I18n.t('plugin.edu')
              plugin.description       = 'TesterHome Edu Function.'
              plugin.navbar_link       = true
              plugin.admin_navbar_link = true
              plugin.root_path         = "/training_courses"
              plugin.admin_path        = "/admin/training_courses"
            end
          end

          app.routes.prepend do
            mount Testerhome::Edu::Engine => '/'
          end

          app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
        end
      end

    end
  end
end
