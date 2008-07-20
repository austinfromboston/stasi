class HelpHour < HelpData
  set_table_name 'swtickettimetrack'
  set_primary_key 'timetrackid'
  belongs_to :help_staffer, :foreign_key => 'forstaffid'
  belongs_to :help_ticket, :foreign_key => 'ticketid'

  has_one :hour_log

  LOCAL_KEYS = {
    :help_hour_id => 'timetrackid',
    :minutes      => 'timespent',
    :agent_id     => 'agent_id',
    :notes        => 'notes',
    :ticket_id    => 'ticket_id',
    :source       => 'source',
    :billing_type => 'billing_type',
    :created_at       => 'created_at',
    :updated_at       => 'created_at'
  }


  def source
    "help_system"
  end

  def billing_type
    'support'
  end

  def agent_id
    Agent.find_by_help_staffer_id( help_staffer.id ).id if help_staffer
  end

  def ticket_id
    Ticket.find_by_help_ticket_id( help_ticket.id ).id if help_ticket
  end

  def created_at
    Time.at( dateline )
  end
end
