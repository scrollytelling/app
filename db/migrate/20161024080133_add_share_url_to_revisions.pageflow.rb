# This migration comes from pageflow (originally 20160715105408)
class AddShareUrlToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :share_url, :string, null: false, default: ''
  end
end
