Pageflow.configure do |config|
  # The email address to use as from header in invitation mails to new
  # users.
  config.mailer_sender = 'info@scrollytelling.io'

  # Activate a constraint for the editor routes defined by Pageflow.
  # This is useful when you have accounts with CNAMEs.
  config.editor_route_constraint = HostConstraint.new

  # Page types available in the editor. Add futher page types from
  # page type engines below.
  config.plugin(Pageflow.built_in_page_types_plugin)
  config.page_types.register(Pageflow::InternalLinks.grid_page_type)
  config.page_types.register(Pageflow::ExternalLinks.page_type)
  config.page_types.register(Pageflow::BeforeAfter::PageType.new)
  config.page_types.register(Pageflow::TextPage.page_type)
  config.page_types.register(Pageflow::EmbeddedVideo.page_type)
  config.page_types.register(Pageflow::Chart.page_type)

  # override the default player controls widget, to make slim player the default
  config.widget_types.register(Pageflow::BuiltInWidgetType.slim_player_controls, default: true)

  # Register tracking code WidgetType per account, so they're not visible across accounts.
  config.widget_types.register(Widgets::Analytics.default)
  %w(
    radio1 nos nieuwsuur volkskrant grasnapolsky beeldengeluid
    amnesty sbb ed psv meerveerkracht
    stephaniestruijk blof ricostickstyphoon krisberry concertatsea
    buildingbridges omroepbrabant destijl).each do |account|
    config.features.register("analytics.#{account}") do |feature_config|
      feature_config.widget_types.register(Widgets::Analytics::WidgetType.new(account))
    end
  end

  config.plugin(Pageflow::LinkmapPage.plugin)
  config.plugin(Scrollytelling::Navigation::Plugin.new)
  config.plugin(Pageflow::Oembed.plugin)

  # Add custom themes by invoking the pageflow:theme generator and
  # registering the theme here.
  #
  #     $ rails generate pageflow:theme my_custom_theme
  #     => creates app/assets/stylesheets/pageflow/themes/my_custom_theme.css.scss
  #
  %i(
    default
    scrollytelling volkskrant nos nieuwsuur radio1 grasnapolsky
    beeldengeluid psv amnesty_international stephaniestruijk concertatsea
    blof buildingbridges ricostickstyphoon sbb worldpressphoto
    phtgrphr waddenzee humanrightswatch alab ed krisberry meerveerkracht
    yip destijl omroepbrabant paxforpeace zevensloten
    hu).each do |theme|
      config.themes.register(theme)
  end

  # String to interpolate into paths of files generated by paperclip
  # preprocessors. This allows to refresh cdn caches after
  # reprocessing attachments.
  config.paperclip_attachments_version = 'v1'

  # Specify default meta tags to use in published stories.
  # These defaults will be included in the page <head> unless overriden by the Entry.
  # If you set these to <tt>nil</tt> or <tt>""</tt> the meta tag won't be included.
  config.default_keywords_meta_tag = 'story, scrollytelling, multimedia, journalism'
  config.default_author_meta_tag = 'Scrollytelling'
  config.default_publisher_meta_tag = 'Scrollytelling'

  # Path to the location in the filesystem where attachments shall
  # be stored. The value of this option is available via the
  # pageflow_filesystem_root paperclip interpolation.
  config.paperclip_filesystem_root = 'tmp/attachments/production'

  # How to handle https requests for URLs which will have assets in the page.
  # If you wish to serve all assets over http and prevent mixed-content warnings,
  # you can force a redirect to http. The inverse is also true: you can force
  # a redirect to https for all http requests.
  #
  #     config.public_https_mode = :prevent (default) # => redirects https to http
  #     config.public_https_mode = :enforce # => redirects http to https
  #     config.public_https_mode = :ignore # => does nothing
  config.public_https_mode = :enforce if Rails.env.in?(%w(staging production))

  # Rewrite the below section to use your favorite configuration
  # method: ENV variables, secrets.yml, custom yml files. If you use
  # environment variables consider the dotenv gem to configure your
  # application via a single .env file.
  #
  # Whatever you choose, do NOT hard code values below. That makes it
  # hard to switch environments and risks leaking secrects.

  # Default options for paperclip attachments which are supposed to
  # use s3 storage. All options allowed in paperclip has_attached_file
  # calls are allowed.
  config.paperclip_s3_default_options.merge!(
    s3_credentials: {
      bucket: ENV['S3_BUCKET'],
      access_key_id: ENV['S3_ACCESS_KEY'],
      secret_access_key: ENV['S3_SECRET_KEY'],
      s3_host_name: ENV['S3_HOST_NAME']
    },
    s3_host_alias: ENV['S3_HOST_ALIAS'],
    s3_protocol: ENV['S3_PROTOCOL'],
    s3_headers: {
      'Expires' => "Wed, 17 Jul 2047 16:58:03 GMT", # keep until we're on Pageflow 12.0.0
      'Cache-Control' => "public, max-age=31536000"
    }
  )

  # Default options for paperclip attachments which are supposed to
  # use filesystem storage. All options allowed in paperclip has_attached_file
  # calls are allowed.
  config.zencoder_options.merge!(
    api_key: ENV['ZENCODER_API_KEY'],
    output_bucket: ENV['S3_OUTPUT_BUCKET'],
    s3_host_alias: ENV['S3_OUTPUT_HOST_ALIAS'],
    s3_protocol: ENV['S3_PROTOCOL'],
    attachments_version: 'v1'
  )
end

# Comment out this call if you wish to run rails generators or rake
# tasks while the Pageflow configuration is in an invalid
# state. Otherwise Pageflow configuration errors might prevent you
# from initializing the environment. Required for Pageflow to run.
Pageflow.finalize!
