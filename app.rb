require "sinatra"
require "slim"
require "sass"
require "compass"
require "autoprefixer-rails"
require 'coffee-script'

set :bind, '0.0.0.0'

get '/' do
  slim :index
end
