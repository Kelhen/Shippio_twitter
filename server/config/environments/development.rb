Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # mail settings
  config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '-i'
  # }
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = { from: 'nottwitter0@gmail.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'nottwitter.com',
    user_name:            'nottwitter0@gmail.com',
    password:             'WDf-CLm-3UM-apE',
    authentication:       'plain',
    enable_starttls_auto: true
  }
  # super secret key do not share :)
  secrets.secret_key_base = 'RgRR7Ge0V6FT4kb6k9Bak1L1J0u0Ryk0CvucZxwuojiXjWBOuv1teOBQCtnRKsXxjCOlBzRGCq9lYZ3z64LICZY9A1ZyxQzhqhSurAUBQaOLNjfLXuYdXoRYKwXwyuanxUalDIGamBMrizoS4u5mSQiCO3qiKNsdN7d2gzcxIrBLvCwHC8HRk7hRt6iWtvXEV1wm7DO6FYGvORYq8KGcDaFJTTCdNNcEpdTGAuUozNK90vQj4QWVc4yLHjCpiSWds2jrEqm1U6Iet6UM3AetjQa5Wt98UnTZga0BHF1aE88Kfd8eb9ds0HRuvizg5nzB'
end
