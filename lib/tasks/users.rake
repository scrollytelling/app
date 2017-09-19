require 'csv'

namespace :users do
  namespace :invite do
    desc "Invite users into the Hogeschool Utrecht account"
    task hu: :environment do
      account = Pageflow::Account.find_by! name: "Hogeschool Utrecht"

      ActiveRecord::Base.transaction do
        users_count = User.count

        # Tab-separated values:
        # email first_name  last_name
        # and no header row.
        CSV.foreach('/Users/joost/Desktop/hu.tsv', col_sep: "\t") do |row|
          first_name = row[1]
          last_name = row[2]
          email = row[0]

          invitation = Pageflow::InvitationForm.new(
            {
              user: {
                first_name: first_name, last_name: last_name, email: email
              },
              membership: {
                entity_id: account.id,
                role: 'member'
              }
            },
            Pageflow::Account
          )
          time = Time.now.strftime("%FT%T%:z")
          puts "[#{time}] \"#{first_name} #{last_name}\" <#{email}> uitgenodigd" if invitation.save
          entry = account.entries.create! title: "Het verhaal van #{first_name}", theming: account.default_theming
          entry.memberships.create! user: invitation.user, role: 'publisher'
        end

        puts
        puts "#{User.count - users_count} users created."
      end
    end
  end
end
