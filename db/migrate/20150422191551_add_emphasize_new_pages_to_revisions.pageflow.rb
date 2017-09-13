# This migration comes from pageflow (originally 20141119164526)
class AddEmphasizeNewPagesToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :emphasize_new_pages, :boolean, default: false, null: false
  end
end
