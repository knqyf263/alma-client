require "alma/client/version"

require 'msgpack-rpc-over-http'

module Alma
  module RPC
    class ClientError < MessagePack::RPCOverHTTP::RemoteError; end
    class ServerError < MessagePack::RPCOverHTTP::RemoteError; end
    class ServiceUnavailableError < MessagePack::RPCOverHTTP::RemoteError; end
  end

  class Client
    RPC_DEFAULT_PORT = 11235
    TIMEOUT_OPTIONS = [:connect_timeout, :send_timeout, :receive_timeout]

    def initialize(host='localhost', port=RPC_DEFAULT_PORT, opts={})
      @client = MessagePack::RPCOverHTTP::Client.new("http://#{host}:#{port}/")

      @client.connect_timeout = opts[:connect_timeout] if opts.has_key?(:connect_timeout) && @client.respond_to?('connect_timeout='.to_sym)
      @client.send_timeout    = opts[:send_timeout]    if opts.has_key?(:send_timeout)    && @client.respond_to?('send_timeout='.to_sym)
      @client.receive_timeout = opts[:receive_timeout] if opts.has_key?(:receive_timeout) && @client.respond_to?('receive_timeout='.to_sym)
    end
    
    def send(target, events)
      @client.call(:send, target, events)
    end
  end
end
