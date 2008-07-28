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
      Contact.class_eval { @grudges = nil }
    end
    it "creates a new grudge when a contact is destroyed" do
      Contact.grudges.stub!(:include?).and_return(false)
      Contact.grudges.should_receive(:<<)
      @contact.destroy
    end

    it "re-saves the grudge file when a contact is destroyed" do
      dump_file = "#{RAILS_ROOT}/config/contact_grudges_test.yaml"
      File.should_receive(:open).with( dump_file, "w" )
      @contact.destroy
    end

    it "creates a new file if it needs to" do
      %x[ rm #{Contact.grudge_dump_file} ]
      @contact.destroy
      File.exists?( Contact.grudge_dump_file ).should be_true
    end

    it "reads grudges from the file if no grudges are initialized" do
      %x[ rm #{Contact.grudge_dump_file} ]
      @contact.destroy
      Contact.class_eval { @grudges = nil }
      Contact.grudge_match?( @contact ).should be_true
    end
  end
end
