require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpHour do
  before do
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
    ht = Ticket.create( @logged_hours.help_ticket.local_attributes )
    hours = HelpHour.find(@logged_hours.id)
    hours.local_attributes.to_a.should include( *{ :agent_id => agent.id, :ticket_id => ht.id }.to_a )
  end
end
