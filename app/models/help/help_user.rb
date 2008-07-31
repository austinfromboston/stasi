class HelpUser < HelpData
  set_table_name 'swusers'
  set_primary_key 'userid'

  has_many :help_tickets,     :foreign_key => 'userid'
  has_many :help_user_emails, :foreign_key => 'userid'

  has_one :contact


  #help users without a ticket are mostly spam
  validate :require_tickets

  LOCAL_KEYS = {
    :name => 'fullname',
    :email => 'most_recent_email',
    :phone => 'phone',
    :help_user_id => 'userid'
  }

  def self.relate_imported_contacts_to_projects
    preamp_keys = YAML.load_file "#{RAILS_ROOT}/config/imported_contacts_and_projects.yaml"
    return unless preamp_keys
    preamp_keys.each do | help_id, preamp_client_id |
      hcontact = Contact.find_by_help_user_id  help_id
      project = Project.find_by_preamp_client_id preamp_client_id
      next unless hcontact && project && hcontact.project_id.nil?
      hcontact.update_attribute( :project_id, project.id )
    end
    rescue
      puts "No contact/project keys found"
  end

  def require_tickets
    errors.add( "no help tickets found") if help_tickets.empty?
  end

  def most_recent_email 
    email_record = help_user_emails.find( :first, :order => 'useremailid DESC' )
    email_record.email if email_record
  end
end
