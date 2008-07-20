class PreampHour < PreampData
  set_table_name 'billing_task'

  LOCAL_KEYS = {
    :notes        => 'summary',
    :billing_type => 'billing_type',
    :source       => 'source',
    :agent_id     => 'find_named_staff',
    :minutes      => 'minutes',
    :created_at   => 'parsed_date',
    :project_id   => 'project_id'
  }

  def source
    'preamp'
  end

  def parsed_date
    Time.parse( date )
  end

  def summary 
    return name if details.empty?
    "#{name}\n" +
    "("-" * 30)}\n" +
    details
  end

  def minutes
    hours.hours / 1.minutes
  end

  def find_named_staff
    Agent.find :first, :conditions => [ 'name LIKE ?', staff ]
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
