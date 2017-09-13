# This migration comes from pageflow (originally 20160201130118)
class AddAdditionalCnamesToThemings < ActiveRecord::Migration
  def change
    add_column :pageflow_themings, :additional_cnames, :string
  end
end
