class TicketsController < ApplicationController

  def index
    client = ZendeskAPI::Client.new do |config|
      # Mandatory:

      config.url = "https://mariagticketapp.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

      # Basic / Token Authentication
      config.username = Rails.application.credentials.zendesk_username

      # Choose one of the following depending on your authentication choice
      # config.token = "your zendesk token"
      config.password = Rails.application.credentials.zendesk_password

      # OAuth Authentication
      # config.access_token = "your OAuth access token"

      # Optional:

      # Retry uses middleware to notify the user
      # when hitting the rate limit, sleep automatically,
      # then retry the request.
      config.retry = true

      # Raise error when hitting the rate limit.
      # This is ignored and always set to false when `retry` is enabled.
      # Disabled by default.
      config.raise_error_when_rate_limited = true

      # Logger prints to STDERR by default, to e.g. print to stdout:
      require 'logger'
      config.logger = Logger.new(STDOUT)

      # Changes Faraday adapter
      # config.adapter = :patron

      # Merged with the default client options hash
      # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}

      # When getting the error 'hostname does not match the server certificate'
      # use the API at https://yoursubdomain.zendesk.com/api/v2
    end

    # Get first ticket
    # ticket = client.tickets.first

    # Get paginated tickets
    @tickets = client.tickets.page(2).per_page(25).to_a
    # tickets = client.tickets.page(params[:page]).per_page(30)
    #
  end

end
