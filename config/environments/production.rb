require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Ensure that Rails sets appropriate caching headers on static assets if
  # Rails is serving static assets in production e.g. on Heroku
  #
  # Overview of Cache-control values:
  #
  #     max-age=<seconds>
  #         The maximum amount of time a resource is considered fresh.
  #
  #     s-maxage=<seconds>
  #         Overrides max-age or the Expires header, but only for shared
  #         caches (e.g., proxies). Ignored by private caches.
  #
  #     More info: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control
  #
  # Our Cache-Control header:
  #
  # * It tells all caches (both proxies like Cloudflare and the users web
  #   browser) that the asset can be cached.
  # * It tells shared caches (e.g. Cloudflare) that they can cache it for 365 days
  # * It tells browsers that they should cache for 365 days
  #
  # Cloudflare will respect s-maxage if it is set so change that value if you
  # want Cloudflare to cache differently than then browser.
  #
  config.public_file_server.headers = {
    "Cache-Control" => "public, s-maxage=#{365.days.seconds}, max-age=#{365.days.seconds}"
  }

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Disable minification since it adds a *huge* amount of time to precompile.
  # Anyway, gzip alone gets us about 70% of the benefits of minify+gzip.
  config.assets.css_compressor = false

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  ##
  # `force_ssl` defaults to on. Set `force_ssl` to false if (and only if) RAILS_FORCE_SSL=false, otherwise set it to true.
  #
  config.force_ssl = ENV.fetch("RAILS_FORCE_SSL", "true").downcase != "false"

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = ENV.fetch("LOG_LEVEL", "info").to_sym

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store
  if ENV.fetch("RAILS_CACHE_REDIS_URL", nil)
    config.cache_store = :redis_cache_store, {
      url: ENV.fetch("RAILS_CACHE_REDIS_URL"),
      ##
      # Configuring a connection pool for Redis as Rails cache is documented in:
      #
      # * https://edgeguides.rubyonrails.org/caching_with_rails.html#connection-pool-options
      #
      # but some more details are available in:
      #
      # * https://github.com/rails/rails/blob/a5d1628c79ab89dfae57ec1e1aeca467e29de188/activesupport/lib/active_support/cache.rb#L168-L173
      # * https://github.com/rails/rails/blob/9b4aef4be3dc58eb08f694387857b52be8050954/activesupport/lib/active_support/cache/redis_cache_store.rb#L185-L192
      #
      pool_size: Integer(ENV.fetch("RAILS_MAX_THREADS", 5)), # number of connections **per puma process**
      pool_timeout: 5 # num seconds to wait for a connection
    }
  end

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "eoin_template_app_production"

  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Production email config
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = {
    host: "www.example.com",
    protocol: "https"
  }
  config.action_mailer.asset_host = "https://www.example.com"

  config.action_mailer.smtp_settings = {
    address: ENV.fetch("SMTP_HOSTNAME"),
    port: ENV.fetch("SMTP_PORT", 587),
    enable_starttls_auto: true,
    user_name: ENV.fetch("SMTP_USERNAME"),
    password: ENV.fetch("SMTP_PASSWORD"),
    authentication: "login",
    domain: "www.example.com"
  }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require "syslog/logger"
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new "app-name")

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
