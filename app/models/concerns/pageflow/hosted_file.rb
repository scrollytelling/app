module Pageflow
  module HostedFile
    # we keep seeing permission errors where uploaded files are
    # dropped into a dir by user `nginx` and the job runner tries
    # to remove them which is not allowed.
    # I have no idea why this doesn't happen on production.
    # Is it an environment issue or Pageflow 12 issue???
    def keep_on_filesystem_after_upload_to_s3?
      true
    end
  end
end
