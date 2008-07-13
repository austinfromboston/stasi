require File.dirname(__FILE__) + '/../spec_helper'

describe TicketUserEmail do
  before do
    @email = create_ticket_user_email
  end
  it "belongs to a user" do
    @email.ticket_user.should be_an_instance_of(TicketUser)
  end
end

