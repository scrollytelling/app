class HomeButtonDisabledByDefault < ActiveRecord::Migration
  def up
    change_column_default(:pageflow_themings, :home_button_enabled_by_default, false)
  end

  def down
    change_column_default(:pageflow_themings, :home_button_enabled_by_default, true)
  end
end
