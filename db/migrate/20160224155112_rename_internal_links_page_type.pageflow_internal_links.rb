# This migration comes from pageflow_internal_links (originally 20150109121800)
class RenameInternalLinksPageType < ActiveRecord::Migration
  def up
    execute(<<-SQL)
      UPDATE pageflow_pages SET template = 'internal_links_grid' WHERE template = 'internal_links';
    SQL
  end

  def down
    execute(<<-SQL)
      UPDATE pageflow_pages SET template = 'internal_links' WHERE template = 'internal_links_grid';
    SQL
  end
end
