module Widgets
  module Analytics
    module Nos
      class WidgetType < Pageflow::WidgetType
        def name
          'analytics_nos'
        end

        def roles
          ['head', 'overview']
        end

        def render_head_fragment(template, entry)
          template.render partial: "widgets/analytics/nos/head", locals: {entry: entry}
        end

        def render(template, entry)
          template.render partial: "widgets/analytics/nos/body", locals: {entry: entry}
        end

        def enabled_in_editor?
          false
        end

        def enabled_in_preview?
          false
        end
      end

      def self.widget_type
        WidgetType.new
      end
    end
  end
end
