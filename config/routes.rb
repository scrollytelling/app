Rails.application.routes.draw do
  # route invalid JS to a 404 since the Facebook spider keeps requesting this.
  get "/piwik.js", to: proc {|env| [404, {"Content-Type" => "text/plain"}, ["You're drunk."]] }
  get "/gtm.js", to: proc {|env| [404, {"Content-Type" => "text/plain"}, ["You're drunk."]] }
  mount Pageflow::Chart::Engine, at: '/chart'

  constraints HostConstraint.new do
    devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  authenticated do
    mount Pageflow::ExternalLinks::Engine, at: "/external_links"
  end

  Pageflow.routes(self)
end
