require File.dirname(__FILE__) + '/../../spec_helper'

describe "Preamp Client" do
  before do
    load_preamp_test_data
    @client = create_preamp_client
  end
  describe "converting to local Project" do
    it "should start now if no start date exists" do
      test_time = Time.now
      Time.stub!(:now).and_return test_time
      @client.parsed_date.should == test_time
    end
    it "converts contacts to an array of hashes" do
      @client.contact_data.should == [ { :primary => true, :name => 'Joe John', :email => 'joe@john.com', :phone => '555-1212', :preamp_client_id => @client.id } ]
    end
    it "converts multiple contacts as necessary" do
      @client.billing_name = "Hector Cervantes"
      @client.contact_data.size.should == 2
    end

    it "splits up multiple emails in the same field" do
      @client.billing_email = "hector@john.com esmerelda@john.com"
      @client.contact_data.size.should == 3
    end

    it "splits up multiple emails with commas" do
      @client.billing_email = "hector@john.com,esmerelda@john.com"
      @client.contact_data.any? { |d| d[:email] == "hector@john.com" }.should be_true
    end

    it "splits up multiple emails with commas" do
      @client.billing_email = "hector@john.com, esmerelda@john.com"
      @client.contact_data.any? { |d| d[:email] == "hector@john.com" }.should be_true
    end

    it "dedupes with multiple emails in the same field" do
      @client.billing_email = "joe@john.com esmerelda@john.com"
      @client.contact_data.size.should == 2
    end

    it "splits multiple emails to single emails" do
      @client.billing_email = "joe@john.com esmerelda@john.com"
      @client.contact_data.any? { |d| d[:email] == "joe@john.com" }.should be_true
    end



    it "merges contact data when the email addresses match" do
      @client.billing_name = "Hector Cervantes"
      @client.billing_email = "joe@john.com"
      @client.contact_data.should == [ { :billable => true, :primary => true, :name => 'Hector Cervantes', :email => 'joe@john.com', :phone => '555-1212', :preamp_client_id => @client.id } ]
    end
  end
end
