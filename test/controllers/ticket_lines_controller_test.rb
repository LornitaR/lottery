require 'test_helper'

class TicketLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_line = ticket_lines(:one)
  end

  test "should get index" do
    get ticket_lines_url, as: :json
    assert_response :success
  end

  test "should create ticket_line" do
    assert_difference('TicketLine.count') do
      post ticket_lines_url, params: { ticket_line: { num_one: @ticket_line.num_one, num_three: @ticket_line.num_three, num_two: @ticket_line.num_two, score: @ticket_line.score, ticket_id: @ticket_line.ticket_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ticket_line" do
    get ticket_line_url(@ticket_line), as: :json
    assert_response :success
  end

  test "should update ticket_line" do
    patch ticket_line_url(@ticket_line), params: { ticket_line: { num_one: @ticket_line.num_one, num_three: @ticket_line.num_three, num_two: @ticket_line.num_two, score: @ticket_line.score, ticket_id: @ticket_line.ticket_id } }, as: :json
    assert_response 200
  end

  test "should destroy ticket_line" do
    assert_difference('TicketLine.count', -1) do
      delete ticket_line_url(@ticket_line), as: :json
    end

    assert_response 204
  end
end
