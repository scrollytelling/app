module Widgets
  module Analytics
    class WidgetType < Pageflow::WidgetType
      attr_reader :account

      def initialize(account)
        @account = account
      end

      def name
        "analytics.#{account}"
      end

      def roles
        ['analytics']
      end

      def render_head_fragment(template, entry)
        template.render partial: "widgets/analytics/#{account}/head", locals: {entry: entry}
      end

      def render(template, entry)
        template.render partial: "widgets/analytics/#{account}/body", locals: {entry: entry}
      end

      def enabled_in_editor?
        false
      end

      def enabled_in_preview?
        false
      end
    end

    def self.default
      WidgetType.new 'default'
    end
  end
end
