module Graveyard
  module Requestable
    METHODS = ::Faraday::Connection::METHODS.clone.freeze

    METHODS.each do |method|
      define_method(method) do |*args|
        connection.send(method, String(self), *args)
      end
    end

    def requestable?; true; end

    protected
      def connection
        Faraday
      end
  end
end
