# This migration comes from pageflow (originally 20141211110226)
class AddConfigurationToChapters < ActiveRecord::Migration
  def change
    add_column :pageflow_chapters, :configuration, :text
  end
end
