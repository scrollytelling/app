require 'rails_helper'

RSpec.describe Pageflow::Account, type: :unit do
  %w(
    scrollytelling volkskrant nos radio1 grasnapolsky
    beeldengeluid psv amnesty_international stephaniestruijk
    blof buildingbridges ricostickstyphoon sbb waddenzee).each do |theme_name|
      it "can use theming #{theme_name}" do
        account = Pageflow::Account.new name: theme_name.capitalize
        account.build_default_theming theme_name: theme_name
        account.save!
      end
    end
end
