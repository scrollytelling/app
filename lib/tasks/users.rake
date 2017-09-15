require 'csv'

namespace :users do
  namespace :invite do
    desc "Invite users into the Hogeschool Utrecht account"
    task hu: :environment do
      account = Pageflow::Account.find_by! name: "Hogeschool Utrecht"

      # Tab-separated values:
      # firstname lastname  email
      CSV.foreach('students.csv') do |row|
        invitation = Pageflow::InvitationForm.new(
          {
            user: {
              firstname: firstname, lastname: lastname, email: email
            },
            membership: {
              entity_id: account.id,
              role: 'member'
            }
          },
          Account
        )
        puts "uitgenodigd" if invitation.save
        entry = account.entries.create! title: "#{firstname} #{lastname}"
        entry.memberships.create! user: invitation.user, role: 'publisher'
      end
    end
  end
end
