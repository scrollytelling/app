ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    if current_user.admin?
      text_node '<iframe width="100%" height="350" src="https://analytics.scrollytelling.io/analytics/index.php?module=Widgetize&action=iframe&forceView=1&viewDataTable=graphEvolution&widget=1&moduleToWidgetize=VisitsSummary&actionToWidgetize=getEvolutionGraph&idSite=1&period=day&date=yesterday&disableLink=1&widget=1" scrolling="no" frameborder="0" marginheight="0" marginwidth="0"></iframe>'.html_safe
    end
  end
end
