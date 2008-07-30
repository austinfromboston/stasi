require File.dirname(__FILE__ ) + '/../spec_helper'

describe TicketsController do
  before do
    stub_authentication
  end
  describe "pagination" do
    before :all do
      200.times { create_ticket( :created_at => Time.mktime(2006,8,10)) }
    end
    it "pulls a single page at once" do
      get :index
      assigns[:tickets].size.should == Ticket.per_page
    end
    it "works with query params active" do
      get :index, :query => { :year => 2006 }
      assigns[:tickets].size.should == Ticket.per_page
    end
  end
  describe "searching" do
    before do
      Ticket.delete_all
      create_ticket :created_at => Time.mktime( 2006, 8, 10 )
      create_ticket :created_at => Time.mktime( 2007, 3, 10 )
      @query_params = { }
    end
    def act!
      get :index, :query => @query_params
    end
    it "returns all results unless params query is set" do
      get :index
      assigns[:tickets].size.should == 2
    end

    describe "by date" do
      it "checks the query params for a year" do
        @query_params[:year] = 2007
        act!
        assigns[:tickets].size.should == 1
      end
      it "checks the query params for a year" do
        @query_params[:month] = 3
        act!
        assigns[:tickets].size.should == 1
      end
    end

    describe "by client" do
    end
  end
end

