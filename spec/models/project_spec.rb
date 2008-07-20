require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before do
    @project = create_project
  end

  describe "building contacts" do
    before do
      Contact.delete_all
      @client = create_preamp_client
      @project.contact_data = [ 
        { :name => 'Joline', :email => 'joline@example.org', :contact_type => 'billing', :preamp_client_id => @client.id },
        { :name => 'Janine', :email => 'janine@example.org', :contact_type => 'main', :preamp_client_id => @client.id }
      ]
    end

    it "creates contacts on save" do
      @project.save
      @project.contacts.size.should == 2
    end

    it "does not create a new contact if one has already been imported from preamp" do
      c = create_contact :project => @project, :preamp_client_id => @client.id, :contact_type => 'main', :name => 'Bailey'
      @project.save
      contacts = @project.contacts(true).find( :all, :conditions => [ "preamp_client_id = ? and contact_type =?", @client.id, 'main' ] )
      contacts.size.should == 1
      contacts.first.name.should == 'Bailey'
    end

    it "updates a contact if a matching email already exists" do
      c = create_contact :name => 'Bailey', :email => 'janine@example.org'
      @project.save
      Contact.find(c).name.should == 'Janine'
    end

    it "attaches a contact to the project if emails match" do
      c = create_contact :name => 'Bailey', :email => 'janine@example.org'
      @project.save
      @project.contacts(true).should include(c)
    end
  end
  
end
