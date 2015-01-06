###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
#HAML
###
set :haml, { :ugly => false, :format => :html5 }

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
page "", :layout => "base"
page "/blog.html", :layout => "base"
page "/blog/*", :layout => "blog"
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###
# Methods defined in the helpers block are available in templates

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  activate :blog do |blog|
      blog.layout = "blog"
      blog.sources = '/blog/{year}-{month}-{day}-{title}.html'
      blog.paginate = true
  end
  activate :directory_indexes
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :build_dir, 'build'

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # Minify HTML on build
  activate :minify_html

  activate :blog do |blog|
      blog.layout = "blog"
      blog.sources = '/blog/{year}-{month}-{day}-{title}.html'
      blog.paginate = true
  end

  activate :directory_indexes


  # Enable cache buster
  # activate :asset_hash

  # activate :relative_links

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
