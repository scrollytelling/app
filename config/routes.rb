require 'resque/server'
require 'resque_scheduler/server'

Rails.application.routes.draw do
  # route invalid JS to a 404 since the Facebook spider keeps requesting this.
  get "/piwik.js", to: proc {|env| [404, {"Content-Type" => "text/plain"}, ["You're drunk."]] }
  get "/gtm.js", to: proc {|env| [404, {"Content-Type" => "text/plain"}, ["You're drunk."]] }

  mount Pageflow::LinkmapPage::Engine, at: '/linkmap_page'
  mount Pageflow::Chart::Engine, at: '/chart'

  constraints HostConstraint.new do
    devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  authenticate :user do
    mount Pageflow::ExternalLinks::Engine, at: "/external_links"
  end

  authenticate :user, lambda {|user| user.admin?} do
    mount Resque::Server.new, at: "/background_jobs"
  end

  Pageflow.routes(self)
end
