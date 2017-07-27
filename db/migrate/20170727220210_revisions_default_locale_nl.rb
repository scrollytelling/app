class RevisionsDefaultLocaleNl < ActiveRecord::Migration
  def change
    change_column :pageflow_revisions, :locale, :string, default: "nl"
  end
end
