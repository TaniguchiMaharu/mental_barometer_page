require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MentalBarometerPage
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators do |g|
      g.assets false # CSSとJavaScriptファイルは自動生成しない
      g.helper false # helperファイルも
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
    config.i18n.default_locale = :ja
  end
end
