require File.dirname(__FILE__) + '/../spec_helper'

describe TicketUser do
  before do
    @user = create_ticket_user
  end
  it "has tickets" do
    @user.tickets << create_ticket( :ticket_user => @user )
    @user.tickets.should_not be_empty
  end
end
