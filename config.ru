require './config/environment'


use Rack::MethodOverride
run ApplicationController
use UsersController
use VinylsController
use VinylDatabasesController