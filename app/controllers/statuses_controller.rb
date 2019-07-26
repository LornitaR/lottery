class StatusesController < ApplicationController
 # /status 
    # POSSIBLE MEANINGS FOR STATUS:
    # OPTION 1: just shows the score for each line, and sets the boolean `checked` to true
    # OPTION 2: check to see if the ticket has ever been checked
    # OPTION 3: check to see if the ticket has been ammended, how many times it was ammended, etc
    # implementing option 1 since it makes the most sense

  # PATCH/PUT /tickets/1/status
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
