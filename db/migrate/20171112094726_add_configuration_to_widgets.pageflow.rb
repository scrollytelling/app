# This migration comes from pageflow (originally 20170201074328)
class AddConfigurationToWidgets < ActiveRecord::Migration
  def change
    add_column :pageflow_widgets, :configuration, :text
  end
end
