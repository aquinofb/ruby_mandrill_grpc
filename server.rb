require './lib/dynamic_mailer'

def run
  s = GRPC::RpcServer.new
  s.add_http2_port('172.16.1.146:50051', :this_port_is_insecure)
  puts(".")
  puts('GRPC server listenning on 172.16.1.146:50051... (ノಠ益ಠ)ノ彡┻━┻')
  s.handle(MessagesService)
  s.run_till_terminated
end

run
