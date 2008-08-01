require File.dirname(__FILE__) + '/../spec_helper'

describe Contact do
  before do
    Contact.delete_all
    @contact = create_contact
  end

  it "finds unassigned contacts" do
    not_assigned = create_contact :project => nil 
    Contact.unassigned.should === [ not_assigned ]
  end

  describe "holding a grudge" do
    before do
      ContactGrudgeRecorder.class_eval { @grudges = nil }
    end
    it "creates a new grudge when a contact is destroyed" do
      ContactGrudgeRecorder.stub!(:match?).and_return(false)
      ContactGrudgeRecorder.should_receive(:before_destroy)
      #@contact.should_receive(:before_dest)
      @contact.destroy
    end

    it "re-saves the grudge file when a contact is destroyed" do
      dump_file = "#{RAILS_ROOT}/config/contact_grudges_test.yaml"
      File.should_receive(:open).with( dump_file, 'w')
      @contact.destroy
    end

    it "creates a new file if it needs to" do
      %x[ rm #{ContactGrudgeRecorder.dump_file} ]
      @contact.destroy
      File.exists?( ContactGrudgeRecorder.dump_file ).should be_true
    end

    it "reads grudges from the file if no grudges are initialized" do
      %x[ rm #{ContactGrudgeRecorder.dump_file} ]
      @contact.destroy
      ContactGrudgeRecorder.class_eval { @grudges = nil }
      ContactGrudgeRecorder.match?( @contact ).should be_true
    end
  end
end
