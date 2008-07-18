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
    :billing_type => 'billing_type'
  }


  def source
    "help_system"
  end

  def billing_type
    'support'
  end

  def agent_id
    help_staffer.agent.id if help_staffer and help_staffer.agent
  end

  def ticket_id
    help_ticket.ticket.id if help_ticket and help_ticket.ticket
  end
end
