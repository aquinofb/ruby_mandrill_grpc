```shell
mkdir -p tmp/mongodb

// start databases
mongod -dbpath=tmp/mongodb
redis-server

// start sidekiq
sidekiq -r ./lib/dynamic_mailer.rb

// start the server
ruby server.rb
```

#### Protoc command
```shell
gem install grpc-tools
grpc_tools_ruby_protoc -I lib/protos --ruby_out=lib/services --grpc_out=lib/services lib/protos/*
```

Mongoid [queries doc](https://docs.mongodb.com/mongoid/master/tutorials/mongoid-queries/).
