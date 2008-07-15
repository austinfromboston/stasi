require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpTicket do
  before do
    @ticket = create_help_ticket
  end
  it "has hours" do
    @ticket.help_hours << create_help_hour( :timespent => 300, :help_ticket => @ticket )
    @ticket.help_hours.should_not be_empty
  end

  it "has posts" do
    @ticket.help_posts << create_help_post( :subject => 'trouble', :help_ticket => @ticket )
    @ticket.help_posts.should_not be_empty
  end

  it "connects to a help ticket" do
    ht = Ticket.create(@ticket.local_attributes)
    new_help_ticket = HelpTicket.find @ticket.id
    new_help_ticket.ticket.should == ht
  end
end


