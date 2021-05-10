class TicketsController < ApplicationController

  def index
    client = ZendeskApiWrapper::CLIENT

    # Get first ticket
    # ticket = client.tickets.first

    # Get paginated tickets
    @tickets = client.tickets.page(2).per_page(25).to_a
    # tickets = client.tickets.page(params[:page]).per_page(30)
    #
  end

end
