namespace :entries do
  task widgets: :environment do
    Pageflow::Entry.find_each do |entry|
      puts "#{entry.id} #{entry.title}"
      entry.revisions.find_each do |revision|
        puts "Revision #{revision.id}"
        widget = revision.widgets.find_by role: "navigation"
        widget.update type_name: "scrollytelling_pageflow_navigation" if widget
      end
    end
  end
end
