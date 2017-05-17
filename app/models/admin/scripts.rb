require 'active_admin'

module Admin
  class Scripts < ActiveAdmin::Views::Footer
    def build
      super
      render partial: 'admin/scripts'
    end
  end
end
