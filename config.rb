Dotenv.load
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
  blog.taglink = 'tags/:tag.html'
end

# Use directory indexes to get rid og .html suffixes in URLs
activate :directory_indexes

# Use bower for JS package management
activate :bower

# Methods defined in the helpers block are available in templates
helpers do
  def github_avatar(username)
    @github_client ||= Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
    user = @github_client.user(username) if username
    return user[:avatar_url] || gravatar_from_hash(user[:gravatar_id]) if user
  rescue
    return nil
  end

  def gravatar_from_email(email)
    gravatar_from_hash Digest::MD5.hexdigest(email.downcase) if email
  end

  def gravatar_from_hash(hash)
    "http://www.gravatar.com/avatar/#{hash}?default=mm"
  end

  def default_avatar
    'http://www.gravatar.com/avatar/?default=mm'
  end

  def avatar_url(member)
    member.logo || github_avatar(member.github) || gravatar_from_email(member.email) || default_avatar
  end
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload
end

# Build-specific configuration
configure :build do
  # Minify everything (also, compress it)
  activate :minify_css
  activate :minify_javascript
  # activate :minify_html
  # activate :gzip

  # Enable cache buster
  activate :asset_hash

  # Create a whole bunch of favicons for various devices and OSes
  activate :favicon_maker, icons: {
    'img/icon-lyon-rb.png' => [
      { icon: 'apple-touch-icon-152x152-precomposed.png' },
      { icon: 'apple-touch-icon-144x144-precomposed.png' },
      { icon: 'apple-touch-icon-120x120-precomposed.png' },
      { icon: 'apple-touch-icon-114x114-precomposed.png' },
      { icon: 'apple-touch-icon-76x76-precomposed.png' },
      { icon: 'apple-touch-icon-72x72-precomposed.png' },
      { icon: 'apple-touch-icon-60x60-precomposed.png' },
      { icon: 'apple-touch-icon-57x57-precomposed.png' },
      { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
      { icon: 'apple-touch-icon.png', size: '57x57' },
      { icon: 'favicon-196x196.png' },
      { icon: 'favicon-160x160.png' },
      { icon: 'favicon-96x96.png' },
      { icon: 'favicon-32x32.png' },
      { icon: 'favicon-16x16.png' },
      { icon: 'favicon.png', size: '16x16' },
      { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      { icon: 'mstile-144x144', format: 'png' }
    ]
  }

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

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
