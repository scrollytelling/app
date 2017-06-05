# TODO temporary patch for the absence of :pageflow_filesystem_root
# We should fix this in Pageflow proper and then kill this file.
if Rails.env.staging?
  require 'paperclip'
  require 'pageflow'

  Paperclip.interpolates(:pageflow_filesystem_root) do |attachment, style|
    Pageflow.config.paperclip_filesystem_root
  end

  Paperclip.interpolates(:host) do |attachment, style|
    'main'
  end
end
