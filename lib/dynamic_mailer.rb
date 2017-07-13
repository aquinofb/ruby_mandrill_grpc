root_path = File.expand_path('../../', __FILE__)
app_path = File.join(root_path, 'app')
services_path = File.join(root_path, 'lib', 'services')

$LOAD_PATH.unshift(app_path)
$LOAD_PATH.unshift(services_path)

require 'sidekiq'
require 'grpc'
require 'dotenv'
require 'mongoid'

Dir[
  *[File.join(app_path, '**/*.rb'), File.join(services_path, '**/*.rb')]
].each {|file| require file }

module DynamicMailer
  Dotenv.load
  Mongoid.load!('config/mongoid.yml', :development)
end
