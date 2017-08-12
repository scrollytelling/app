class MigrateNavigationWidgets < ActiveRecord::Migration
  def up
    Pageflow::Widget.
      where(role: 'navigation').
      find_each do |widget|
        widget.update! type_name: 'scrollytelling_navigation'
      end
  end

  def down
    # nope. NOPE!
  end
end
