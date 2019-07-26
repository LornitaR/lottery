class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all()
    render json: @tickets
  end

  # GET /tickets/1
  def show
    @ticket =TicketLine.where("ticket_id = ?", @ticket.id)
     
    render json: @ticket
  end

  # POST /tickets
  def create
    @ticket = Ticket.new()
    @ticket.save()
    
    generate_ticket_lines @ticket
    

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    # assuming that ammending the ticket just means to add new lines
    # shouldn't be able to edit the numbers since it's a lottery
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:number_of_lines)
    end

    def generate_ticket_lines ticket
      # randomly generate numbers for the ticket lines
      ticket_params.to_i.times do |line|
        num_one = rand(3)
        num_two = rand(3)
        num_three = rand(3)
        score = get_score(num_one, num_two, num_three)
        ticket_line = TicketLine.new(:num_one => num_one, :num_two => num_two, :num_three => num_three, :score => score, :ticket_id => ticket.id)
        ticket_line.save()
      end
    end

    def get_score num_one, num_two, num_three
      case
      when num_one + num_two + num_three == 2
        return 10
      when [num_one, num_two, num_three].uniq.count == 1
        return 5
      when (num_one != num_two) && (num_one != num_three)
        return 1
      else
        return 0
      end
    end

    # /status 
    # POSSIBLE MEANINGS FOR STATUS:
    # OPTION 1: just shows the score for each line, and sets the boolean `checked` to true
    # OPTION 2: check to see if the ticket has ever been checked 
    # OPTION 3: check to see if the ticket has been ammended, how many times it was ammended, etc 
    # implementing option 1 since it makes the most sense
end
