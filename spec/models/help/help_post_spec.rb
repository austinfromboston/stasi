require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpPost do
  before do
    @post = new_help_post
  end
  it "belongs to a HelpStaff" do
    @post.help_staffer.should be_an_instance_of(HelpStaffer)
  end

  it "belongs to a ticket" do
    @post.help_ticket.should be_an_instance_of(HelpTicket)
  end
end

