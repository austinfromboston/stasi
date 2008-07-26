class PreampHour < PreampData
  set_table_name 'billing_task'
  belongs_to :preamp_client, :foreign_key => 'client_id'
  def self.inheritance_column
    nil
  end

  LOCAL_KEYS = {
    :notes        => 'summary',
    :billing_type => 'billing_type',
    :source       => 'source',
    :agent        => 'find_named_staff',
    :minutes      => 'minutes',
    :created_at   => 'parsed_date',
    :project_id   => 'project_id',
    :preamp_hour_id => 'id'
  }

  def source
    'preamp'
  end

  def parsed_date
    date ? date.to_time : Time.now
  end

  def summary 
    return name if details.blank?
    "#{name}\n" +
    "#{("-" * 30)}\n" +
    details
  end

  def minutes
    hours.hours / 1.minutes
  end

  def find_named_staff
    Agent.find :first, :conditions => [ 'name LIKE ?', "%#{staff}%" ]
  end

  def project_id
    proj = Project.find_by_preamp_client_id( client_id )
    proj.id if proj
  end

  def billing_type
    return 'bugfix' if type == 'bug fix'
    type
  end
end
