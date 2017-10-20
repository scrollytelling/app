ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Codeship" do
          div do
            img src: "https://app.codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master"
          end
          i "Codeship test nieuwe code die wij toevoegen."
        end
      end

      column do
        panel "Cloud 66" do
          div do
            img src: "https://app.cloud66.com/stacks/badge/10057d9994bc47c4edd94b88e9fce635.svg", height: 18
          end
          i "Cloud 66 zet het vervolgens geautomatiseerd online."
        end
      end
    end
  end
end
