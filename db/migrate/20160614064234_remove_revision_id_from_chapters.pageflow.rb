# This migration comes from pageflow (originally 20150830105831)
class RemoveRevisionIdFromChapters < ActiveRecord::Migration
  def change
    remove_column :pageflow_chapters, :revision_id
  end
end
