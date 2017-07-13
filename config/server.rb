require_relative 'application'

module DynamicMailer
  class Server
    class << self
      def run!
        host = ENV.fetch('GRPC_HOST', '127.0.0.1:50051')
        s = GRPC::RpcServer.new
        s.add_http2_port(host, :this_port_is_insecure)
        puts(".")
        puts("GRPC server listenning on #{host}... (ノಠ益ಠ)ノ彡┻━┻")
        s.handle(MessagesService)
        s.run_till_terminated
      end
    end
  end
end
