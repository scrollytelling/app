# This migration comes from pageflow_external_links (originally 20141218183701)
class ChangeSiteUrlToText < ActiveRecord::Migration
  def change
    change_column(:pageflow_external_links_sites, :url, :text)
  end
end
