# This migration comes from pageflow (originally 20150115175116)
class AddFeaturesConfigurationToAccounts < ActiveRecord::Migration
  def change
    add_column :pageflow_accounts, :features_configuration, :text
  end
end
