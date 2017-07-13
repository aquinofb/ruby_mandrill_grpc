root_path = File.expand_path('../../', __FILE__)
app_path = File.join(root_path, 'app')
lib_path = File.join(root_path, 'lib')

$LOAD_PATH.unshift(lib_path, app_path)

require 'sidekiq'
require 'grpc'
require 'dotenv'
require 'mongoid'

Dir[
  *[File.join(lib_path, '**/*.rb'), File.join(app_path, '**/*.rb')]
].each {|file| require file }

module DynamicMailer
  Dotenv.load
  Mongoid.load!('config/mongoid.yml', :development)
end
