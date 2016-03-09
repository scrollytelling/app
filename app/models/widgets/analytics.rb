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

    # Static factory methods, one per analytics account.
    def self.radio1
      WidgetType.new 'radio1'
    end

    def self.nos
      WidgetType.new 'nos'
    end

    def self.volkskrant
      WidgetType.new 'volkskrant'
    end

    def self.grasnapolsky
      WidgetType.new 'grasnapolsky'
    end

    def self.beeldengeluid
      WidgetType.new 'beeldengeluid'
    end

    def self.psv
      WidgetType.new 'psv'
    end

    def self.stephaniestruijk
      WidgetType.new 'stephaniestruijk'
    end

    def self.amnesty
      WidgetType.new 'amnesty'
    end
  end
end
