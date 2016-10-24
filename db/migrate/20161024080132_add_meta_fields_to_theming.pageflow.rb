# This migration comes from pageflow (originally 20160617123557)
class AddMetaFieldsToTheming < ActiveRecord::Migration
  def change
    add_column :pageflow_themings, :default_author, :string
    add_column :pageflow_themings, :default_publisher, :string
    add_column :pageflow_themings, :default_keywords, :string
  end
end
