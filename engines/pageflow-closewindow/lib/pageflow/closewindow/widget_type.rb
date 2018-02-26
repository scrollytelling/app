require 'pageflow/widget_type'

module Pageflow
  module Closewindow
    class WidgetType < ::Pageflow::WidgetType
      def name
        'closewindow'
      end

      def roles
        ['home']
      end

      def render(template, entry)
        template.render partial: 'pageflow/closewindow/widget', locals: {
          entry: entry
        }
      end
    end
  end
end
