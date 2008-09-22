require File.dirname(__FILE__) + '/../spec_helper'

describe HourLog do
  before do
    @hour_log = create_hour_log
  end

  describe "searching by time" do
    before do
      HourLog.delete_all
      create_hour_log :created_at => Time.mktime( 2007, 3, 10 )
      create_hour_log :created_at => Time.mktime( 2006, 7, 10 )
    end

    it "finds records by year" do
      HourLog.from_year( 2007 ).size.should == 1
    end
    it "finds records by month" do
      HourLog.from_month( 7 ).size.should == 1
    end

    it "finds all records" do
      HourLog.all.size.should == 2
    end
  end

  describe "conversion from basecamp" do
    before do
      @basecamp_entry = Basecamp::TimeEntry.new "date"=> Time.mktime( 2008, 9, 15).to_date, "id"=>10471220, "description"=>nil, "hours"=>0.5, "person_id"=>1293173, 'todo_item_id' => nil
      Agent.delete_all
      create_agent :id => 5, :basecamp_id => 1293173
    end

    it "converts hours to minutes" do
      HourLog.convert_from_basecamp( @basecamp_entry )[:minutes].should == 30
    end

    it "finds people" do
      HourLog.convert_from_basecamp( @basecamp_entry )[:agent_id].should == 5
    end

    it "converts dates to times" do
      HourLog.convert_from_basecamp( @basecamp_entry )[:created_at].should == Time.mktime( 2008, 9, 15 )
    end

  end
end
