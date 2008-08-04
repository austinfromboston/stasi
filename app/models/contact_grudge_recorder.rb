class ContactGrudgeRecorder

  def self.dump_file
    "#{RAILS_ROOT}/config/contact_grudges_#{Rails.env}.yaml"
  end

  def self.before_destroy( item )
    create( item )
  end

  def self.grudges
    @grudges ||= YAML.load_file( self.dump_file ) || []
    rescue
      @grudges = []
  end

  def self.match?(item)
    grudges.include?( build(item) )
  end

  def self.create(item)
    return true if match?(item)
    @grudges << build(item)
    File.open( dump_file, "w") { |f|  YAML.dump( grudges, f ) }
  end

  def self.build(item)
    { :name => item.name, :preamp_client_id => item.preamp_client_id, :help_user_id => item.help_user_id, :email => item.email }
  end
end
