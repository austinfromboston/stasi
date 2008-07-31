require File.dirname(__FILE__) + '/../../spec_helper'

describe "PreampHour" do
  before do
    load_preamp_test_data
    @hour = create_preamp_hour
  end
  describe "converting to local" do
    it "reports source as preamp" do
      @hour.source.should == 'preamp' 
    end

    it "parses existing dates" do
      @hour.parsed_date.should == Time.mktime( 2007, 3, 10 )
    end

    it "summarizes name of tasks" do
      @hour.summary.should match(/Work/)
    end
    it "summarizes details of tasks" do
      @hour.summary.should match(/on phone/)
    end
    it "gives only name without separator if there are no details" do
      @hour.details = nil
      @hour.summary.should == @hour.name
    end

    it "returns hours reported as a # of minutes" do
      @hour.hours = 1.75
      @hour.minutes.should == 105
    end

    it "finds a named agent" do
      Agent.delete_all
      ag = create_agent :name => "Margot B" 
      @hour.staff = "Margot"
      @hour.find_named_staff.should == ag
    end

    it "finds an existing linked project" do
      Project.delete_all
      client = create_preamp_client
      @hour.client_id = client.id
      prj = create_project :preamp_client_id => client.id
      @hour.project_id.should == prj.id
    end

    it "modifies billing types with spaces" do
      @hour.type = 'bug fix'
      @hour.billing_type.should == 'bugfix'
    end

    it "passes through most billing types" do
      @hour.type = "fabulous"
      @hour.billing_type.should == 'fabulous'
    end
    
    
  end
end
