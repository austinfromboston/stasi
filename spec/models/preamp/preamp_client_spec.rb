require File.dirname(__FILE__) + '/../../spec_helper'

describe "Preamp Client" do
  before do
    @client = create_preamp_client
  end
  describe "converting to local Project" do
    it "should start now if no start date exists" do
      test_time = Time.now
      Time.stub!(:now).and_return test_time
      @client.parsed_date.should == test_time
    end
    it "converts contacts to an array of hashes" do
      @client.contact_data.should == [ { :contact_type => 'main', :name => 'Joe John', :email => 'joe@john.com', :phone => '555-1212', :preamp_client_id => @client.id } ]
    end
    it "converts multiple contacts as necessary" do
      @client.billing_name = "Hector Cervantes"
      @client.contact_data.size.should == 2
    end
  end
end
