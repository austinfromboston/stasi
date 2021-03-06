require File.dirname(__FILE__ ) + '/../spec_helper'

describe HourLogsController do
  before do
    stub_authentication
  end
  describe "searching" do
    before do
      HourLog.delete_all
      create_hour_log :created_at => Time.mktime( 2006, 8, 10 )
      create_hour_log :created_at => Time.mktime( 2007, 3, 10 )
      @query_params = { }
    end
    def act!
      get :index, :query => @query_params
    end
    it "returns all results unless params query is set" do
      get :index
      assigns[:hour_logs].size.should == 2
    end
    describe "by date" do
      it "checks the query params for a year" do
        @query_params[:year] = 2007
        act!
        assigns[:hour_logs].size.should == 1
      end
      it "checks the query params for a year" do
        @query_params[:month] = 3
        act!
        assigns[:hour_logs].size.should == 1
      end
    end
  end
end
