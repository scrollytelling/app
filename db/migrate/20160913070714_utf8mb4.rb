class Utf8mb4 < ActiveRecord::Migration
  def self.up
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8mb4;"

    ActiveRecord::Base.connection.tables.each do |table|
      execute "ALTER TABLE `#{table}` CHARACTER SET = utf8mb4;"
    end

    execute "ALTER TABLE active_admin_comments MODIFY `namespace` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `resource_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `resource_type` varchar(255) CHARACTER SET utf8mb4 NOT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `author_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `body` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE friendly_id_slugs MODIFY `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL"
    execute "ALTER TABLE friendly_id_slugs MODIFY `sluggable_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE friendly_id_slugs MODIFY `scope` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_accounts MODIFY `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `default_file_rights` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `landing_page_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `features_configuration` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_filesystem_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_filesystem_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_s3_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_s3_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `state` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `encoding_error_message` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `format` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `rights` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"

    execute "ALTER TABLE pageflow_chapters MODIFY `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_chapters MODIFY `configuration` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE pageflow_entries MODIFY `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_entries MODIFY `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL"
    execute "ALTER TABLE pageflow_entries MODIFY `features_configuration` text CHARACTER SET utf8mb4"
    execute "ALTER TABLE pageflow_entries MODIFY `password_digest` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_external_links_sites MODIFY `url` text CHARACTER SET utf8mb4"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `thumbnail` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `description` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE pageflow_file_usages MODIFY `file_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_folders MODIFY `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_image_files MODIFY `unprocessed_attachment_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `unprocessed_attachment_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `processed_attachment_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `processed_attachment_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `state` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `rights` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"

    execute "ALTER TABLE pageflow_memberships MODIFY `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_pages MODIFY `template` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_pages MODIFY `configuration` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE pageflow_revisions MODIFY `credits` text CHARACTER SET utf8mb4"
    execute "ALTER TABLE pageflow_revisions MODIFY `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_revisions MODIFY `summary` text CHARACTER SET utf8mb4"
    execute "ALTER TABLE pageflow_revisions MODIFY `snapshot_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `home_url` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_revisions MODIFY `locale` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `author` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `publisher` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `keywords` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_storylines MODIFY `configuration` text CHARACTER SET utf8mb4"

    execute "ALTER TABLE pageflow_themings MODIFY `imprint_link_url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `imprint_link_label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `copyright_link_url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `copyright_link_label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `cname` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_themings MODIFY `theme_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `home_url` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_themings MODIFY `additional_cnames` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_filesystem_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_filesystem_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_s3_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_s3_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `state` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `encoding_error_message` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `thumbnail_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `format` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `poster_file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `poster_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `rights` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_video_files MODIFY `thumbnail_content_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE pageflow_widgets MODIFY `subject_type` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_widgets MODIFY `type_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE pageflow_widgets MODIFY `role` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"

    execute "ALTER TABLE schema_migrations MODIFY `version` varchar(255) CHARACTER SET utf8mb4 NOT NULL"

    execute "ALTER TABLE users MODIFY `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `first_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `last_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `role` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'editor'"
    execute "ALTER TABLE users MODIFY `locale` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `encrypted_password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `reset_password_token` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `current_sign_in_ip` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `last_sign_in_ip` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `confirmation_token` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `unconfirmed_email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `unlock_token` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `authentication_token` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL"
  end

  def self.down
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8;"

    ActiveRecord::Base.connection.tables.each do |table|
      execute "ALTER TABLE `#{table}` CHARACTER SET = utf8;"
    end

    execute "ALTER TABLE active_admin_comments MODIFY `namespace` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `resource_id` varchar(255) CHARACTER SET utf8 NOT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `resource_type` varchar(255) CHARACTER SET utf8 NOT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `author_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE active_admin_comments MODIFY `body` text CHARACTER SET utf8"

    execute "ALTER TABLE friendly_id_slugs MODIFY `slug` varchar(255) CHARACTER SET utf8 NOT NULL"
    execute "ALTER TABLE friendly_id_slugs MODIFY `sluggable_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE friendly_id_slugs MODIFY `scope` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_accounts MODIFY `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `default_file_rights` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `landing_page_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_accounts MODIFY `features_configuration` text CHARACTER SET utf8"

    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_filesystem_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_filesystem_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_s3_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `attachment_on_s3_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `state` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `encoding_error_message` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `format` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_audio_files MODIFY `rights` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"

    execute "ALTER TABLE pageflow_chapters MODIFY `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_chapters MODIFY `configuration` text CHARACTER SET utf8"

    execute "ALTER TABLE pageflow_entries MODIFY `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_entries MODIFY `slug` varchar(255) CHARACTER SET utf8 NOT NULL"
    execute "ALTER TABLE pageflow_entries MODIFY `features_configuration` text CHARACTER SET utf8"
    execute "ALTER TABLE pageflow_entries MODIFY `password_digest` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_external_links_sites MODIFY `url` text CHARACTER SET utf8"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `thumbnail` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_external_links_sites MODIFY `description` text CHARACTER SET utf8"

    execute "ALTER TABLE pageflow_file_usages MODIFY `file_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_folders MODIFY `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_image_files MODIFY `unprocessed_attachment_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `unprocessed_attachment_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `processed_attachment_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `processed_attachment_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `state` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_image_files MODIFY `rights` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"

    execute "ALTER TABLE pageflow_memberships MODIFY `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_pages MODIFY `template` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_pages MODIFY `configuration` text CHARACTER SET utf8"

    execute "ALTER TABLE pageflow_revisions MODIFY `credits` text CHARACTER SET utf8"
    execute "ALTER TABLE pageflow_revisions MODIFY `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_revisions MODIFY `summary` text CHARACTER SET utf8"
    execute "ALTER TABLE pageflow_revisions MODIFY `snapshot_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `home_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_revisions MODIFY `locale` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `author` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `publisher` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_revisions MODIFY `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_storylines MODIFY `configuration` text CHARACTER SET utf8"

    execute "ALTER TABLE pageflow_themings MODIFY `imprint_link_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `imprint_link_label` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `copyright_link_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `copyright_link_label` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `cname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_themings MODIFY `theme_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_themings MODIFY `home_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_themings MODIFY `additional_cnames` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_filesystem_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_filesystem_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_s3_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `attachment_on_s3_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `state` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `encoding_error_message` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `thumbnail_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `format` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `poster_file_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `poster_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_video_files MODIFY `rights` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''"
    execute "ALTER TABLE pageflow_video_files MODIFY `thumbnail_content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE pageflow_widgets MODIFY `subject_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_widgets MODIFY `type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE pageflow_widgets MODIFY `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL"

    execute "ALTER TABLE schema_migrations MODIFY `version` varchar(255) CHARACTER SET utf8 NOT NULL"

    execute "ALTER TABLE users MODIFY `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `first_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `last_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `role` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'editor'"
    execute "ALTER TABLE users MODIFY `locale` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `encrypted_password` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `reset_password_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `current_sign_in_ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `last_sign_in_ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `confirmation_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `unconfirmed_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `unlock_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
    execute "ALTER TABLE users MODIFY `authentication_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL"
  end
end
