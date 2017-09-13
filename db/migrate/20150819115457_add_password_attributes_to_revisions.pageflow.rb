# This migration comes from pageflow (originally 20150603091823)
class AddPasswordAttributesToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :password_protected, :boolean
    add_column :pageflow_entries, :password_digest, :string
  end
end
