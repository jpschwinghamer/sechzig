require 'compass/import-once/activate'
require 'autoprefixer-rails'

http_path = "/"
css_dir = "public/css"
sass_dir = "assets/sass"
images_dir = "public/images"
javascripts_dir = "public/js"

on_stylesheet_saved do |file|
  css = File.read(file)
  File.open(file, 'w') do |io|
    io << AutoprefixerRails.process(css)
  end
end
