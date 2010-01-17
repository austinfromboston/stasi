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
          lp.organization_id = org.id
          lp.save
          project.save

        end

        #affiliations
        if project.linein_organization_id
          project.contacts.each do |contact|
            next unless contact.linein_person_id
            unless aff = Linein::Affiliation.find( :first, :params => { :query => { :person_id => contact.linein_person_id, :organization_id => project.linein_organization_id } } )
              Linein::Affiliation.create :person_id => contact.linein_person_id, :organization_id => project.linein_organization_id 
            end
          end
        end

        #contracts
        project.contracts.each do |contract|
          next if contract.linein_contract_id
          lcon = Linein::Contract.create contract.linein_attributes
          contract.linein_contract_id = lcon.id
          contract.save
        end
      end
    end
    def assign_hours_to_contracts
      HourLog.all.each do |hl|
        unless hl.contract_id
          if hl.project
            hl.update_attribute :contract_id, hl.project.contracts.first.linein_contract_id
          end
        end
      end
    end
    def create_line_items
      HourLog.all.each do |hl|
        Linein::LineItem.create_from_hour_log( hl )
      end
    end
  end
end
