class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_raven_context

  private

  def set_raven_context
    Raven.user_context({
      id: current_user.id,
      email: current_user.email,
      name: current_user.full_name}) if user_signed_in?
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
