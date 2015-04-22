# This migration comes from pageflow (originally 20141208161030)
class AddLocaleToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :locale, :string
  end
end
