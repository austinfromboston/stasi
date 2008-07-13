require File.dirname(__FILE__) + '/../spec_helper'

describe TicketHour do
  before do
    @logged_hours = new_ticket_hour
  end
  it "belongs to a TicketStaff" do
    @logged_hours.ticket_staffer.should be_an_instance_of(TicketStaffer)
  end
  it "belongs to a ticket" do
    @logged_hours.ticket.should be_an_instance_of(Ticket)
  end
end
