ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel "Wat zeggen de robot overlords over onze Scrollytelling computercode?" do
      img src: "https://app.codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master"
      img src: "https://app.cloud66.com/stacks/badge/5ab71f9be03652639847e5da1362cafe.svg", height: 18
    end
  end
end
