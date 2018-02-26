require 'pageflow/plugin'

module Pageflow
  module Closewindow
    class Plugin < ::Pageflow::Plugin
      def configure(config)
        config.features.register("closewindow") do |feature_config|
          feature_config.widget_types.register(Pageflow::Closewindow.widget_type)
        end
      end
    end
  end
end
