require 'bundler'
Bundler.require(:default)

module Basic
  class Application < Rail::Application
    # Import assets from other gems:
    # config.gems << 'turbolinks'
    #
    # Precompile assets using `rake assets`:
    # config.precompile << 'application.css'
    # config.precompile << 'application.js'
    # config.precompile << 'index.html'
    #
    # Compress assets:
    # config.compress = true
  end
end
