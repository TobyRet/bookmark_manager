require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/link'
require './lib/tag'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/application.rb'

require_relative 'controllers/application.rb'
require_relative 'links.rb'
require_relative 'sessions.rb'
require_relative 'tags.rb'
require_relative 'users.rb'

use Rack::Flash

enable :sessions
set :session_secret, 'very secret password'









