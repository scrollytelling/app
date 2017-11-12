# This migration comes from pageflow (originally 20170315130000)
class AddThemeNameToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :theme_name, :string, null: false, default: 'default'

    execute(<<-SQL)
      UPDATE pageflow_revisions, pageflow_entries, pageflow_themings
      SET pageflow_revisions.theme_name = pageflow_themings.theme_name
      WHERE pageflow_revisions.entry_id = pageflow_entries.id
      AND pageflow_entries.theming_id = pageflow_themings.id
    SQL
  end
end
