# Our upload user (nginx) has very little permissions.
# The job runner (deploy) doesn't have the rights to delete them either.
# Just keep the uploaded files so we can move on with our lives.
require 'pageflow/hosted_file'
module Pageflow
  module HostedFile
    def keep_on_filesystem_after_upload_to_s3?
      true
    end
  end
end
