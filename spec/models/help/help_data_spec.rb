require File.dirname(__FILE__) + '/../../spec_helper'

describe "HelpData" do
  before(:all) do
    load_ticket_test_schema
  end
  it "should be an abstract class" do
    HelpData.should be_abstract_class
  end
  it  "connects to the test db during tests" do
    HelpData.make_connection
    HelpData.connection.current_database.should == "tickets_dump_test"
  end 
  it  "connects to the standard db during production" do
    Rails.stub!(:env).and_return('production')
    HelpData.make_connection
    HelpData.connection.current_database.should == "tickets_dump"
  end 
  
end
