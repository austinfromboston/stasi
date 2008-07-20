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
end
