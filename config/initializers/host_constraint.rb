# Because we have different CNAMEs pointing to us, we constrain the routes
# for the editor to our own application.
#
# Pageflow will use the redirect URL of themings with matching CNAME,
# or display a 404 page for requests outside the route constraint.
class HostConstraint
  def matches?(request)
    return true if Rails.env.in? %w(test development)
    /scrollytelling.io\z/.match?(request.host)
  end
end
