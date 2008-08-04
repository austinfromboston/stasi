require File.dirname( __FILE__ ) + '/../spec_helper'

describe Contract do
  before do
    @contract = create_contract
  end
  
  describe "when assigning charges" do
    before do
      @log_1 = @contract.project.hour_logs.create :minutes => 25
      @log_2 = @contract.project.hour_logs.create :minutes => 45
      @log_3 = @contract.project.hour_logs.create :minutes => 15
    end

    def act!
      @contract.assign_charges( [ @log_1, @log_2, @log_3 ] )
    end

    it "assigns overage amounts" do
      act!
      @log_2.overage.should_not be_nil
    end

    it "calculates the overage by subtracting the monthly support hours" do
      act!
      @log_2.overage.should == 40
    end

    it "does not charge for hours within the limit" do
      act!
      @log_1.charges.should be_nil
    end

    it "charges at the contract rate for hours above the limit" do
      act!
      @log_3.charges.should  ==  25
    end
    
  end
end
