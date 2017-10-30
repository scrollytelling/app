class DropOembedOembeds < ActiveRecord::Migration
  def up
    drop_table :pageflow_oembed_oembeds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
