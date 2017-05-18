# Because we have different CNAMEs pointing to us, we constrain the routes
# for the editor to our own application.
#
# Pageflow will use the redirect URL of themings with matching CNAME,
# or display a 404 page for requests outside the route constraint.
class HostConstraint
  def matches?(request)
    return true if Rails.env.in? %w(test development)
    request.host =~ /scrollytelling.io\z/

    # from Ruby 2.4 onward use this:
    # /scrollytelling.io\z/.match?(request.host)
  end
end
