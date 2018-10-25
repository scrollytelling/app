desc "rake files > files.json 2> s3.txt"
task files: :environment do
  files = {}
  Pageflow::Account.find_each do |account|
    theming = account.default_theming.theme_name
    files[theming] = {}
    STDERR.puts "# #{theming}"
    STDERR.puts

    account.entries.published.find_each do |entry|
      published = Pageflow::PublishedEntry.find(entry.slug, Pageflow::Entry)
      files[theming][entry.slug] = {}
      STDERR.puts "## #{entry.slug}"
      STDERR.puts

      # "url":"https://media.scrollytelling.com/main/video_files/attachment_on_s3s/000/003/013/original/187G1126.mp4?1528532883"
      Pageflow.config.file_types.to_a.each do |file_type|
        files[theming][entry.slug][file_type.type_name] = []
        published.find_files(file_type.model).each do |file|
          if url = file.url
            match = url.match /\/\/(.*\d{3}\/\d{3}\/\d{3})/
            files[theming][entry.slug][file_type.type_name] << url
            STDERR.puts "aws s3 sync \"s3://#{match[1]}\" \"#{match[1]}\""
          end
        end
      end

      STDERR.puts
    end

    STDERR.puts
  end

  puts files.to_json
end
