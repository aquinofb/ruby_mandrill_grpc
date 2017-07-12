$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'mongoid'
Mongoid.load!('config/mongoid.yml', :development)

%w{
  sidekiq
  grpc
  services/message_pb
  services/message_services_pb
}.each { |file| require file }

Dir["./app/**/*.rb"].each {|file| require file }

module DynamicMailer
end
