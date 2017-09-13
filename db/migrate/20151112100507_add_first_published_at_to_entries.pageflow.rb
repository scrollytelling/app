# This migration comes from pageflow (originally 20151022080518)
class AddFirstPublishedAtToEntries < ActiveRecord::Migration
  def change
    add_column :pageflow_entries, :first_published_at, :datetime

    execute(<<-SQL)
      UPDATE pageflow_entries SET first_published_at = (
        SELECT MIN(published_at)
        FROM pageflow_revisions
        WHERE pageflow_revisions.entry_id = pageflow_entries.id
        LIMIT 1
      );
    SQL
  end
end
