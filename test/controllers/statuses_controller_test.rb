require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should update status" do
    put ticket_status_change_url(@ticket), params: { ticket: { id: @ticket.id, status_checked: true } }, as: :json
    assert_response 200
  end

end
