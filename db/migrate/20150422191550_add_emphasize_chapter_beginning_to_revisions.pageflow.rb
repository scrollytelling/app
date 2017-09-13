# This migration comes from pageflow (originally 20141028125408)
class AddEmphasizeChapterBeginningToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :emphasize_chapter_beginning, :boolean, default: false, null: false
  end
end
