namespace :revisions do
  task widgets: :environment do
    Pageflow::Revision.find_each do |revision|
      puts "Revision #{revision.id}"
      revision.widgets.where(role: "navigation").destroy_all
      revision.widgets.create! role: "navigation", type_name: "scrollytelling_pageflow_navigation"
    end
  end
end
