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
    :status           => 'status'
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
end
