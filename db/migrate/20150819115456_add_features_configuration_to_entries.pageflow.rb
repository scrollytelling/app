# This migration comes from pageflow (originally 20150115175207)
class AddFeaturesConfigurationToEntries < ActiveRecord::Migration
  def change
    add_column :pageflow_entries, :features_configuration, :text
  end
end
