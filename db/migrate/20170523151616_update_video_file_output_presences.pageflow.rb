# This migration comes from pageflow (originally 20170222124848)
class UpdateVideoFileOutputPresences < ActiveRecord::Migration
  def up
    execute(<<-SQL)
      UPDATE pageflow_video_files
        SET output_presences = '{"high":true,"medium":true,"low":true}'
        WHERE output_presences IS NULL;
    SQL
  end

  def down
  end
end
