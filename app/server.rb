require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require './lib/link'
require './lib/tag'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb
# set :views, 'path/to/my/tiffanie_views' if you do not want to put views in the same file 

require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'controllers/users'
