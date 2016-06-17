Rails.application.routes.draw do
  constraints HostConstraint.new do
    devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  authenticated do
    mount Pageflow::ExternalLinks::Engine, at: "/external_links"
  end

  Pageflow.routes(self)
end
