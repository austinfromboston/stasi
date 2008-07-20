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

  def parsed_date
    date_started ? date_started.to_time : Time.now
  end

  def contact_data
    [ :main, :billing, :other ].map { |ctype| data_for_contact(ctype) }.compact
  end

  def data_for_contact( contact_type = :main )
    source_ids = { :contact_type => contact_type.to_s, :preamp_client_id => client_id }
    contact = { 
      :name   => self.send("#{contact_type}_name"),
      :email  => self.send("#{contact_type}_email"),
      :phone  => self.send("#{contact_type}_phone"),
    }
    contact.merge( source_ids ) if contact.values.any?
  end
end
