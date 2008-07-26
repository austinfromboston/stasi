require File.dirname(__FILE__) + '/../spec_helper'

describe Contact do
  before do
    Contact.delete_all
    @contact = create_contact
  end

  it "finds unassigned contacts" do
    not_assigned = create_contact :project => nil 
    Contact.unassigned.should === [ not_assigned ]
  end
end
