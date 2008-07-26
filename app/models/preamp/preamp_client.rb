class PreampClient < PreampData
  set_table_name 'amp_clients'
  set_primary_key 'client_id'


  LOCAL_KEYS = {
    :organization     =>  'Organization',
    :url              =>  'URL',
    :preamp_client_id =>  'client_id',
    :created_at       =>  'parsed_date',
    :contact_data     =>  'contact_data',
    :preamp_status    =>  'client_status'
  }

  LOCAL_CONTACT_TYPES = {
    :billing  => :billable,
    :main     => :primary
  }

  def parsed_date
    date_started ? date_started.to_time : Time.now
  end

  def contact_data
    [ :main, :billing, :other ].inject([]) do |contacts, ctype| 
      data = data_for_contact(ctype) 
      if data 
        emails = data[:email] ? data[:email].split( /,|,?\s+/ ) : [ nil ]
        emails.each do | email |
          matched = contacts.find{ |c| c[:email] == email }
          if email && matched
            contacts[ contacts.index(matched)] = matched.merge( data.delete_if { |key, value| value.nil? } ).merge( :email => email )
          else
            contacts << data.merge( :email => email )
          end
        end
      end
      contacts
    end
    
  end

  def data_for_contact( contact_type = :main )
    
    source_metadata = { :preamp_client_id => client_id }
    source_metadata[ LOCAL_CONTACT_TYPES[ contact_type ]] = true if LOCAL_CONTACT_TYPES[ contact_type ] 
    contact = { 
      :name   => self.send("#{contact_type}_name"),
      :email  => self.send("#{contact_type}_email"),
      :phone  => self.send("#{contact_type}_phone"),
    }
    contact.merge( source_metadata ) if contact.values.any?
  end
end
