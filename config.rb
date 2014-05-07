require "bundler/setup"
require "slim"
require "lib/page_pipeline"
Bundler.require

# ------------------------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ------------------------------------------------------------------------------------

activate :ember
activate :livereload
activate :sprockets
activate :page_pipeline
activate :emblem

set :emblem_dir, "assets/stylesheets/templates"
set :emblem_ext, "emblem"

set :images_dir, 'assets/images/'
set :css_dir, 'assets/stylesheets/'
set :js_dir, 'application'
set :fonts_dir, 'assets/fonts/'

# Bower uses sprockets
ignore 'vendor/*'

# ------------------------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ------------------------------------------------------------------------------------

compass_config do |config|
  config.add_import_path "vendor/foundation/scss"
  config.http_path = "/"
  config.css_dir = "assets/stylesheets"
  config.sass_dir = "assets/stylesheets"
  config.images_dir = "assets/images"
  config.javascripts_dir = "application"
  config.output_style = :compact
  config.line_comments = true
end

# Set slim-lang output style
Slim::Engine.disable_option_validator!
Slim::Engine.set_default_options :pretty => true
# Set template languages
set :slim, {:layout_engine => :slim}

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
  sprockets.append_path File.join "#{root}", "assets/fonts"
end

# ------------------------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ------------------------------------------------------------------------------------

configure :development do
  set :debug_assets, true
end

configure :build do
  activate :relative_assets
  activate :gzip
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :asset_hash, :ignore => [/^vendor/]
  set :ember_variant, :production
end
