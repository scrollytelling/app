require 'rails/engine'

module Pageflow
  module Closewindow
    class Engine < Rails::Engine
      isolate_namespace Pageflow::Closewindow

      config.autoload_paths += Dir[Engine.root.join('lib')]
    end
  end
end
