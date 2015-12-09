Rails.application.routes.draw do
  constraints HostConstraint.new do
    devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  Pageflow.routes(self)
end
