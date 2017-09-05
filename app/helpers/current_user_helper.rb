require 'openssl'

module CurrentUserHelper
  def current_user_memberships
    current_user.
      memberships.
      map do |membership|
        "#{membership.entity.name} (#{membership.role})"
      end.join(", ")
  end

  def intercom_user_hash
    OpenSSL::HMAC.hexdigest \
      'sha256',
      ENV.fetch('INTERCOM_SECRET_KEY'),
      current_user.email
  end
end
