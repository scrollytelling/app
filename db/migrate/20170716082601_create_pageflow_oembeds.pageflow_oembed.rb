# This migration comes from pageflow_oembed (originally 20170715161924)
class CreatePageflowOembeds < ActiveRecord::Migration
  def change
    create_table :pageflow_oembed_oembeds do |t|
      t.string :type, null: false, default: ''
      t.string :version, null: false, default: ''
      t.string :url, null: false, default: '', limit: 191
      t.string :title
      t.string :author_name
      t.string :author_url
      t.text :html
      t.integer :width, limit: 8
      t.integer :height, limit: 8
      t.string :provider_name
      t.string :provider_url
      t.integer :cache_age, limit: 8
      t.datetime :cache_until
      t.string :thumbnail_url
      t.integer :thumbnail_width, limit: 8
      t.integer :thumbnail_height, limit: 8
      t.index :url, unique: true
      t.timestamps
    end
  end
end
