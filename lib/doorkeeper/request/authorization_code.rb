require 'doorkeeper/request/strategy'

module Doorkeeper
  module Request
    class AuthorizationCode < Strategy
      delegate :grant, :client_via_uid, :parameters, to: :server

      def request
        @request ||= OAuth::AuthorizationCodeRequest.new(
          Doorkeeper.configuration,
          grant,
          client_via_uid,
          parameters
        )
      end
    end
  end
end
