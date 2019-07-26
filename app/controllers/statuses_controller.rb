class StatusesController < ApplicationController

  # PATCH/PUT /statuses/1
  def update
    # set the status_checked bool on the ticket to true
    @ticket = Ticket.find(ticket_number)
    @ticket.status_checked = true
    @ticket.save()

    if @ticket.save
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def ticket_number
      params.require(:ticket_id)
    end
end
