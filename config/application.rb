root_path = File.expand_path('../../', __FILE__)

['lib/services'].each { |file|
  $LOAD_PATH.unshift(File.join(root_path, file))
}

require 'sidekiq'
require 'grpc'
require 'dotenv'
require 'mongoid'

Dir[
  *[File.join(root_path, 'lib', '**/*.rb'), File.join(root_path, 'app', '**/*.rb')]
].each {|file| require file }

module DynamicMailer
  Dotenv.load
  Mongoid.load!('config/mongoid.yml', :development)
end
