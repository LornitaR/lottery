class TicketLinesController < ApplicationController
  before_action :set_ticket_line, only: [:show, :update, :destroy]

  # GET /ticket_lines
  def index
    @ticket_lines = TicketLine.all

    render json: @ticket_lines
  end

  # GET /ticket_lines/1
  def show
    render json: @ticket_line
  end

  # POST /ticket_lines
  def create
    @ticket_line = TicketLine.new(ticket_line_params)

    if @ticket_line.save
      render json: @ticket_line, status: :created, location: @ticket_line
    else
      render json: @ticket_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ticket_lines/1
  def update
    if @ticket_line.update(ticket_line_params)
      render json: @ticket_line
    else
      render json: @ticket_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ticket_lines/1
  def destroy
    @ticket_line.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_line
      @ticket_line = TicketLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_line_params
      params.require(:ticket_line).permit(:num_one, :num_two, :num_three, :score, :ticket_id)
    end
end
