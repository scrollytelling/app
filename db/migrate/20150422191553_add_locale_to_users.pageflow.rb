# This migration comes from pageflow (originally 20141128150305)
class AddLocaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string
  end
end
