require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpStaffer do
  before do
    @staff = HelpStaffer.new :fullname => "Cherri"
    @staff.email = "john@do.com"
  end
  describe "works like any other model" do
    it "can have an email" do
      @staff.email = 'john'
      @staff.email.should == 'john'
    end

    it "saves and reloads" do
      @staff.save 
      new_staff = HelpStaffer.find @staff.id
      new_staff.fullname.should == @staff.fullname
    end
  end

  it "converts data to local format" do
    @staff.local_attributes.to_a.should include(*{ :name => "Cherri", :email => "john@do.com" })
  end

  it "connects to a agent" do
    @staff.save
    agent = Agent.create( @staff.local_attributes )
    new_staff = HelpStaffer.find( @staff.id )
    new_staff.agent.should == agent
  end
end
