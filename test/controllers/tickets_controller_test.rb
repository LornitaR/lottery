require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url, as: :json
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { id: @ticket.id }, number_of_lines: 1 }, as: :json
    end

    assert_response 201
  end

  test "should show ticket" do
    get ticket_url(@ticket), as: :json
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { id: @ticket.id }, number_of_lines: 1}, as: :json
    assert_response 200
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket), as: :json
    end

    assert_response 204
  end

  test "score should be calculated correctly" do
    @line = ticket_lines(:two)
    patch ticket_line_url(@line), params: { ticket_line: { num_one: 1, num_three: 2, num_two: 0, ticket_id: 123 } }, as: :json
    assert score = 5
  end
end
