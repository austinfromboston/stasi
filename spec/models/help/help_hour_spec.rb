require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpHour do
  before(:all) do
    load_ticket_test_schema
  end
  before do
    HelpHour.delete_all
    @logged_hours = new_help_hour
  end
  it "belongs to a HelpStaff" do
    @logged_hours.help_staffer.should be_an_instance_of(HelpStaffer)
  end
  it "belongs to a ticket" do
    @logged_hours.help_ticket.should be_an_instance_of(HelpTicket)
  end

  it "generates attributes for local objects" do  
    @logged_hours.save
    agent = Agent.create( @logged_hours.help_staffer.local_attributes )
    #agent = Agent.find_by_help_staffer_id(@logged_hours.help_staffer.id)
    ht = Ticket.create( @logged_hours.help_ticket.local_attributes )
    hours = HelpHour.find(@logged_hours.id)
    hours.local_attributes.to_a.should include( *{ :agent_id => agent.id, :ticket_id => ht.id }.to_a )
  end

  it "reports source as the help_system" do
    @logged_hours.source.should == 'help_system'
  end

  it "reports billing type as support" do
    @logged_hours.billing_type.should == 'support'
  end
end
