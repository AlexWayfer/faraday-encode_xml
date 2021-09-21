# frozen_string_literal: true

require 'faraday/middleware/encode_xml'
require 'faraday/encode_xml/version'

module Faraday
  # This will be your middleware main module, though the actual middleware implementation will go
  # into Faraday::Middleware::MyMiddleware for the correct namespacing.
  module EncodeXML
    # Faraday allows you to register your middleware for easier configuration.
    # This step is totally optional, but it basically allows users to use a
    # custom symbol (in this case, `:my_middleware`), to use your middleware in their connections.
    # After calling this line, the following are both valid ways to set the middleware in a connection:
    # * conn.use Faraday::Middleware::MyMiddleware
    # * conn.use :my_middleware
    # Without this line, only the former method is valid.
    # Faraday::Middleware.register_middleware(encode_xml: Faraday::Middleware::EncodeXML)

    # Alternatively, you can register your middleware under Faraday::Request or Faraday::Response.
    # This will allow to load your middleware using the `request` or `response` methods respectively.
    #
    # Load middleware with conn.request :my_middleware
    Faraday::Request.register_middleware(xml: Faraday::Middleware::EncodeXML)

    # Load middleware with conn.response :my_middleware
    # Faraday::Response.register_middleware(my_adapter: Faraday::Middleware::MyMiddleware)
  end
end
