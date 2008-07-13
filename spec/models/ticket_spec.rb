require File.dirname(__FILE__) + '/../spec_helper'

describe Ticket do
  before do
    @ticket = create_ticket
  end
  it "has hours" do
    @ticket.ticket_hours << create_ticket_hour( :timespent => 300, :ticket => @ticket )
    @ticket.ticket_hours.should_not be_empty
  end

  it "has posts" do
    @ticket.ticket_posts << create_ticket_post( :subject => 'trouble', :ticket => @ticket )
    @ticket.ticket_posts.should_not be_empty
  end
end


