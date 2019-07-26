require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  test "score is calculated correctly" do
    ticket_line = TicketLine.first()

    case
    when ticket_line.num_one + ticket_line.num_two + ticket_line.num_three == 2
      assert ticket_line.score = 10
    when [ticket_line.num_one, ticket_line.num_two, ticket_line.num_three].uniq.count == 1
      assert ticket_line.score =  5
    when (ticket_line.num_one != ticket_line.num_two) && (ticket_line.num_one != ticket_line.num_three)
      assert ticket_line.score =  1
    else
      assert ticket_line.score =  0
    end
  end
end
