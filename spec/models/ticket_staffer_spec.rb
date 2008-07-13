require File.dirname(__FILE__) + '/../spec_helper'

describe TicketStaffer do
  describe "works like any other model" do
    before do
      @staff = TicketStaffer.new :fullname => "Cherri"
    end
    it "can have an email" do
      @staff.email = 'john'
      @staff.email.should == 'john'
    end

    it "saves and reloads" do
      @staff.save 
      new_staff = TicketStaffer.find @staff.id
      new_staff.fullname.should == @staff.fullname
    end
  end
end
