require 'yaml'

# Render client-side analytics scripts for published entries.
module AnalyticsHelper
  def scrolly_analytics_script_tag(entry)
    render partial: "analytics/piwik",
      locals: {entry: entry, account: entry.account}
  end

  def google_analytics_script_tag(entry)
    file = Rails.root.join('config/analytics/google_analytics.yml')
    analytics = YAML.load_file(file)
    theme = entry.theming.theme_name

    render partial: "analytics/google_analytics",
      locals: {analytics: analytics[theme]} if analytics[theme]
  end
end
