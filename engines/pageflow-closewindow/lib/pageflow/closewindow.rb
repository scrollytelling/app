require "pageflow/closewindow/engine"
require "pageflow/closewindow/plugin"
require "pageflow/closewindow/widget_type"

module Pageflow
  module Closewindow
    def self.engine
      Engine
    end

    def self.plugin
      Plugin.new
    end

    def self.widget_type
      WidgetType.new
    end
  end
end
