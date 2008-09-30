module RadicalDesigns
  class LineinConnection
    def transfer
      puts "starting contacts"
      Contact.all.each do |contact|
        next if contact.linein_person_id
        person = Linein::Person.create contact.linein_attributes
        contact.linein_person_id = person.id
        contact.save
      end
      puts "starting projects"
      Project.all.each do |project|
        next if project.linein_project_id
        puts project.display_name
        lp = Linein::Project.create project.linein_attributes
        project.linein_project_id = lp.id
        project.save
        #org
        unless project.organization.blank?
          unless org = Linein::Organization.find( :first, :params => { :query => { :name => project.organization }} )
            org = Linein::Organization.create :name => project.organization
          end
          project.linein_organization_id = org.id
          project.save
        end
        #contracts
        unless project.contracts.empty?
          project.contracts.each do |contract|
            next if contract.linein_contract_id
            lcon = Linein::Contract.create contract.linein_attributes
            contract.linein_contract_id = lcon.id
            contract.save
          end
        end
      end
    end
  end
end
