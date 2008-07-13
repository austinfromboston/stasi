require File.dirname(__FILE__) + '/../spec_helper'

describe TicketPost do
  before do
    @post = new_ticket_post
  end
  it "belongs to a TicketStaff" do
    @post.ticket_staffer.should be_an_instance_of(TicketStaffer)
  end

  it "belongs to a ticket" do
    @post.ticket.should be_an_instance_of(Ticket)
  end
end

