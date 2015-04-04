###
#HAML
###
set :haml, { :ugly => true, :format => :html5 }

###
# Page options, layouts, aliases and proxies
###
page "", :layout => "base"
page "/blog.html", :layout => "base"
page "/blog/*", :layout => "blog"
page "/beta.html", :layout => "base"

# Development-specific configuration
configure :development do
  activate :disqus do |d|
      d.shortname = 'antumbra-development'
  end
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
  # Utilize gzip compression
  activate :gzip
  # Minify HTML on build
  activate :minify_html

  activate :disqus do |d|
      d.shortname = 'antumbra'
  end

  activate :blog do |blog|
      blog.layout = "blog"
      blog.sources = '/blog/{year}-{month}-{day}-{title}.html'
      blog.paginate = true
  end

  activate :directory_indexes
end
