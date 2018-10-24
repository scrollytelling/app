task files: :environment do
  files = {}
  Pageflow::Account.find_each do |account|
    theming = account.default_theming.theme_name
    files[theming] = {}
    account.entries.published.find_each do |entry|
      published = Pageflow::PublishedEntry.find(entry.slug, Pageflow::Entry)
      files[theming][entry.slug] = {}

      # "url":"https://media.scrollytelling.com/main/video_files/attachment_on_s3s/000/003/013/original/187G1126.mp4?1528532883"
      files[theming][entry.slug][:video_files] = published.find_files(Pageflow::VideoFile).map do |file|
        m = file['url'].match /https:\/\/(\w+.\w+.\w+)/
        n = file['url'].match /(\/\d{3}\/\d{3}\/\d{3})/
        { bucket: m[1], path: n[1], url: file['url'] }
      end
    end
  end

  files.to_json
end
