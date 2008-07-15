require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpUser do
  before do
    @user = create_help_user
  end
  it "has tickets" do
    @user.help_tickets << create_help_ticket( :help_user => @user )
    @user.help_tickets.should_not be_empty
  end
end
