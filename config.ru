require './config/environment'


use Rack::MethodOverride
run ApplicationController
use SessionsController
use UsersController
use VinylsController