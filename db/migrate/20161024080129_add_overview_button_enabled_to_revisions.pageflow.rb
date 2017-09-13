# This migration comes from pageflow (originally 20160225075853)
class AddOverviewButtonEnabledToRevisions < ActiveRecord::Migration
  def change
    add_column :pageflow_revisions, :overview_button_enabled, :boolean, default: true, null: false
  end
end
