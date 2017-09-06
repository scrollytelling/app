ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel "Wat zegt de testrobot over onze artisanale huisgedraaide computercode?" do
      image_tag "https://app.codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master"
    end
  end
end
