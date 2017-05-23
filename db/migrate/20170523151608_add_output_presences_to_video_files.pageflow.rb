# This migration comes from pageflow (originally 20160707125400)
class AddOutputPresencesToVideoFiles < ActiveRecord::Migration
  def change
    add_column :pageflow_video_files, :output_presences, :text
  end
end
