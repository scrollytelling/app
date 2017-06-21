# This migration comes from pageflow_chart (originally 20160211085234)
class AddUseCustomThemeToScrapedSites < ActiveRecord::Migration
  def change
    add_column :pageflow_chart_scraped_sites, :use_custom_theme, :boolean, default: true, null: false
  end
end
