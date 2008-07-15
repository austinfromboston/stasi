class HelpTicket < HelpData
  set_table_name 'swtickets'
  set_primary_key 'ticketid'

  has_many :help_hours, :foreign_key => 'ticketid'
  has_many :help_posts, :foreign_key => 'ticketid'
  belongs_to :help_user, :foreign_key => 'userid'

  has_one :ticket
  LOCAL_KEYS = {
    :help_ticket_id => 'ticketid'
  }
end
