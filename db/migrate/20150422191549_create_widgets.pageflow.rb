# This migration comes from pageflow (originally 20141027102310)
class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :pageflow_widgets do |t|
      t.belongs_to :subject, polymorphic: true
      t.string :type_name
      t.string :role

      t.timestamps
    end
  end
end
