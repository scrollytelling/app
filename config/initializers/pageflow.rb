Pageflow.configure do |config|
  # The email address to use as from header in invitation mails to new
  # users.
  config.mailer_sender = 'info@scrollytelling.io'

  # Activate a constraint for the editor routes defined by Pageflow.
  # This is useful when you have accounts with CNAMEs.
  config.editor_route_constraint = HostConstraint.new

  config.available_locales = [:nl, :en]

  # Page types available in the editor. Add futher page types from
  # page type engines below.
  config.plugin(Pageflow.built_in_page_types_plugin)
  config.plugin(Pageflow::InternalLinks.plugin)
  config.plugin(Pageflow::ExternalLinks.plugin)
  config.plugin(Pageflow::LinkmapPage.plugin)
  config.plugin(Pageflow::Localfocus.plugin)
  config.page_types.register(Pageflow::TextPage.page_type)
  config.page_types.register(Pageflow::EmbeddedVideo.page_type)
  config.page_types.register(Pageflow::BeforeAfter.page_type)

  # override the default player controls widget, to make slim player the default
  config.widget_types.register(Pageflow::BuiltInWidgetType.navigation, default: true)
  config.widget_types.register(Pageflow::BuiltInWidgetType.mobile_navigation, default: true)
  config.widget_types.register(Pageflow::BuiltInWidgetType.slim_player_controls, default: true)

  # use our skin
  config.plugin(Scrollytelling::Navigation.plugin)

  # Add custom themes by copying the default theme and adding it here.
  %i(
    default
    scrollytelling volkskrant nos nieuwsuur radio1 grasnapolsky
    beeldengeluid psv amnesty_international stephaniestruijk concertatsea
    blof ricostickstyphoon sbb worldpressphoto
    phtgrphr waddenzee humanrightswatch alab ed krisberry meerveerkracht
    yip destijl omroepbrabant paxforpeace zevensloten
    hu centraalmuseum uaf anwb growinghome).each do |theme|
      config.themes.register(theme)
  end

  # Register custom script WidgetType per account
  # By wrapping them in a feature they're not visible across accounts.
  config.widget_types.register(Widgets::Analytics.default)
  %w(beeldengeluid nieuwsuur nos radio1 volkskrant).each do |account|
    config.features.register("analytics.#{account}") do |feature_config|
      feature_config.widget_types.register(Widgets::Analytics::WidgetType.new(account))
    end
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

  # The directory on the server where uploads are stored before processing.
  # If you are using more than one server to host Pageflow, it is required
  # that all web servers and all process servers have write access to it.
  #
  # The :pageflow_filesystem_root interpolation is available in paperclip.
  if ENV['PAPERCLIP_FILESYSTEM_ROOT']
    config.paperclip_filesystem_root = ENV['PAPERCLIP_FILESYSTEM_ROOT']
  end

  # How to handle https requests for URLs which will have assets in the page.
  # If you wish to serve all assets over http and prevent mixed-content warnings,
  # you can force a redirect to http. The inverse is also true: you can force
  # a redirect to https for all http requests.
  #
  #     config.public_https_mode = :prevent (default) # => redirects https to http
  #     config.public_https_mode = :enforce # => redirects http to https
  #     config.public_https_mode = :ignore # => does nothing
  config.public_https_mode = ENV.fetch('public_https_mode', 'ignore').to_sym

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
    },
    s3_region: 'eu-central-1',
    s3_host_name: ENV['S3_HOST_NAME'],
    s3_host_alias: ENV['S3_HOST_ALIAS'],
    s3_protocol: ENV.fetch('S3_PROTOCOL', 'https')
  )

  # Default options for paperclip attachments which are supposed to
  # use filesystem storage. All options allowed in paperclip has_attached_file
  # calls are allowed.
  config.zencoder_options.merge!(
    api_key: ENV['ZENCODER_API_KEY'],
    output_bucket: ENV['S3_OUTPUT_BUCKET'],
    s3_host_alias: ENV['S3_OUTPUT_HOST_ALIAS'],
    s3_protocol: 'https',
    attachments_version: 'v1',
    skip_smil: true
  )
end

Pageflow.after_configure do
  Pageflow::EntriesHelper.prepend(HelperOverrides)
  Pageflow::EntriesController.helper(AnalyticsHelper)
  Pageflow::RevisionsController.helper(AnalyticsHelper)
end

# Comment out this call if you wish to run rails generators or rake
# tasks while the Pageflow configuration is in an invalid
# state. Otherwise Pageflow configuration errors might prevent you
# from initializing the environment. Required for Pageflow to run.
Pageflow.finalize!
