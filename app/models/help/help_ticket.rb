class HelpTicket < HelpData
  set_table_name 'swtickets'
  set_primary_key 'ticketid'

  has_many    :help_hours,  :foreign_key => 'ticketid'
  has_many    :help_posts,  :foreign_key => 'ticketid'
  belongs_to  :help_user,   :foreign_key => 'userid'

  has_one :ticket
  LOCAL_KEYS = {
    :help_ticket_id   => 'ticketid',
    :messages         => 'dump_posts',
    :subject          => 'subject',
    :messages_count   => 'count_posts',
    :status           => 'status',
    :contact_id       => 'contact_id',
    :agent_ids        => 'agent_ids',
    :created_at       => 'created_at',
    :updated_at       => 'created_at'
  }

  STATUS = {
    1 => "open",
    2 => "on hold",
    3 => "closed",
    4 => "stalled"
  }

  def dump_posts
    help_posts.map(&:summary).join( "\n\n#{("-"*30)}\n\n")
  end

  def status
    STATUS[ ticketstatusid ]
  end

  def count_posts
    help_posts.size
  end

  def contact_id
    contact  = Contact.find_by_help_user_id( help_user.id ) if help_user
    contact.id if contact
  end

  def agent_ids
    hour_agents = Agent.find_all_by_help_staffer_id( help_hours.map { |hour| hour.help_staffer.id if hour.help_staffer }.compact )
    post_agents = Agent.find_all_by_help_staffer_id( help_posts.map { |post| post.help_staffer.id if post.help_staffer }.compact )
    (hour_agents + post_agents ).map(&:id)
  end

  def created_at
    Time.at( dateline )
  end
end
