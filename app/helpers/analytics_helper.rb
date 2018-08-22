require 'yaml'

# Render client-side analytics scripts for published entries.
module AnalyticsHelper
  def google_analytics_script_tag(entry)
    file = Rails.root.join('config/analytics/google_analytics.yml')
    analytics = YAML.load_file(file)
    theme = entry.theming.theme_name

    if analytics[theme]
      render partial: 'analytics/google_analytics',
             locals: { analytics: analytics[theme] }
    end
  end
end
