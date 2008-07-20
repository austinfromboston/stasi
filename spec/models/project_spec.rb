require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before do
    @project = create_project
  end

  describe "building contacts" do
    before do
      Contact.delete_all
      @client = create_preamp_client
      @contact_data = [ 
        { :name => 'Joline', :email => 'joline@example.org', :contact_type => 'billing', :preamp_client_id => @client.id },
        { :name => 'Janine', :email => 'janine@example.org', :contact_type => 'main', :preamp_client_id => @client.id },
        { :name => 'Maximo', :email => 'maximo@example.org', :contact_type => 'test' }
      ]
    end

    def act!
      @project.contact_data = @contact_data
      @project.save
    end

    it "creates contacts on save" do
      act!
      @project.contacts.size.should == 3
    end

    it "does not create a new contact if one has already been imported from preamp" do
      act!
      @project.contact_data = [ { :project => @project, :preamp_client_id => @client.id, :contact_type => 'main', :name => 'Bailey' } ]
      contacts = @project.contacts(true).find( :all, :conditions => [ "preamp_client_id = ? and contact_type =?", @client.id, 'main' ] )
      contacts.size.should == 1
      contacts.first.name.should == 'Janine'
    end

    it "updates a contact if a matching email already exists" do
      act!
      c = @project.contacts.find_by_name "Maximo"
      @project.contact_data = [ { :name => 'Ted', :email => 'maximo@example.org' } ]
      @project.save
      Contact.find(c).name.should == 'Ted'
    end

    it "attaches a contact to the project if emails match" do
      c = create_contact :name => 'Bailey', :email => 'janine@example.org'
      act!
      @project.contacts(true).should include(c)
    end

    it "works on create too!" do
      p = Project.create( :contact_data => @contact_data, :preamp_client_id => @client.id )
      p.id.should_not be_nil
    end
  end
  
end
