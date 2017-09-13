# This migration comes from pageflow (originally 20150830110006)
class RemoveEntryIdFromChapters < ActiveRecord::Migration
  def change
    remove_column :pageflow_chapters, :entry_id
  end
end
