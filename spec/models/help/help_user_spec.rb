require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpUser do
  before do
    @user = create_help_user
  end
  it "has tickets" do
    @user.help_tickets << create_help_ticket( :help_user => @user )
    @user.help_tickets.should_not be_empty
  end

  describe "when making local attributes" do
    it "passes a name" do
      @user.fullname = "Maresy Doates"
      contact = Contact.create(@user.local_attributes)
      contact.name.should match(/Doat/)
    end

    it "passes a the most recent email" do
      HelpUserEmail.delete_all
      @user.help_user_emails.create :email => 'joe@joe.com'
      @user.help_user_emails.create :email => 'joe@jane.com'
      contact = Contact.create(@user.local_attributes)
      contact.email.should match(/jane.com/)
    
    end
  end
end
