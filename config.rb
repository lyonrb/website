require 'digest/md5'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false

page '/sitemap.xml', :layout => false, :format => :xhtml

# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Add vendor prefixes to CSS rules (using values from caniuse.com)
activate :autoprefixer

# Set timezone to France
Time.zone = 'Paris'

# Activate blogging features
activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = ':title'
  blog.default_extension = '.md'
  blog.layout = 'blogpost.haml'
  blog.paginate = true
  blog.tag_template = 'blog/tag.html'
  blog.taglink = '/tags/:tag.html'
end

# Use directory indexes to get rid og .html suffixes in URLs
activate :directory_indexes

# Use bower for JS package management
activate :bower

# Methods defined in the helpers block are available in templates
helpers do
  def gravatar(email)
    email ||= ''
    image_tag 'http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email.downcase)
  end
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

  # Disable Google Analytics
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Build-specific configuration
configure :build do
  # Minify everything (also, compress it)
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :gzip

  # Enable cache buster
  activate :asset_hash

  # Create a whole bunch of favicons for various devices and OSes
  activate :favicon_maker, favicon_maker_base_image: 'img/logo-ruby.png'

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Add Google Analytics support
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-20067061-1'
  end
end

activate :deploy do |deploy|
  # Deploy using git
  deploy.method = :git
  # Deploy on git remote named gh-pages
  deploy.remote = 'origin'
  # Deploy on branch master of this git remote
  deploy.branch = 'gh-pages'
end
