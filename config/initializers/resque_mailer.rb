# We also excluded the production environment because often there would be
# strange errors with this gem; for instance symbolize_keys! not working.
Resque::Mailer.excluded_environments = [:development, :test, :production]
