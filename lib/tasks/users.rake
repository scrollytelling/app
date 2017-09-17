require 'csv'

namespace :users do
  namespace :invite do
    desc "Invite users into the Hogeschool Utrecht account"
    task hu: :environment do
      account = Pageflow::Account.find_by! name: "Hogeschool Utrecht"

      # Tab-separated values:
      # firstname lastname  email
      CSV.foreach('students.csv', col_sep: "\t") do |row|
        invitation = Pageflow::InvitationForm.new(
          {
            user: {
              first_name: row[0], last_name: row[1], email: row[2]
            },
            membership: {
              entity_id: account.id,
              role: 'member'
            }
          },
          Pageflow::Account
        )
        time = Time.now.strftime("%FT%T%:z")
        puts "[#{time}] \"#{row[0]} #{row[1]}\" <#{row[2]}> uitgenodigd" if invitation.save
        entry = account.entries.create! title: "Het verhaal van #{row[0]}", theming: account.default_theming
        entry.memberships.create! user: invitation.user, role: 'publisher'
      end
    end
  end
end
