```shell
mkdir -p tmp/mongodb
mongod -dbpath=tmp/mongodb
sidekiq -r ./lib/dynamic_mailer
ruby server.rb
```

#### Protoc command
```shell
gem install grpc-tools
grpc_tools_ruby_protoc -I protos --ruby_out=lib/services --grpc_out=lib/services protos/*
```
