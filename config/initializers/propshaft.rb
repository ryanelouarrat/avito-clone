# Configure asset pipeline
Rails.application.config.assets.paths ||= []
Rails.application.config.assets.paths << Rails.root.join("app/assets/stylesheets")
Rails.application.config.assets.paths << Rails.root.join("app/assets/images")
Rails.application.config.assets.paths << Rails.root.join("app/assets/builds")