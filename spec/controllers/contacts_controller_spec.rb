require File.dirname(__FILE__ ) + '/../spec_helper'

describe ContactsController do

  describe "GET #index" do
    describe "searching" do
      describe "by project" do
        it "should check for unassigned contacts" do
          Contact.should_receive( :unassigned ).and_return( stub_everything( 'unassigned search proxy' ))
          get :index, :query => { :project_id => 'unassigned' }
          
        end

        it "should search for contacts by project id" do
          Project.should_receive( :find ).with(2).and_return( create_project )
          get :index, :query => { :project_id => 2 }
        end
      end
    end
  end
end

