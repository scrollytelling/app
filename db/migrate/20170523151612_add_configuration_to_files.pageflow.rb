# This migration comes from pageflow (originally 20160929102700)
class AddConfigurationToFiles < ActiveRecord::Migration
  def change
    add_column :pageflow_audio_files, :configuration, :text
    add_column :pageflow_image_files, :configuration, :text
    add_column :pageflow_video_files, :configuration, :text
  end
end
