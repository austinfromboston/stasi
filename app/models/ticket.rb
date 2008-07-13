class Ticket < TicketData
  set_table_name 'swtickets'
  set_primary_key 'ticketid'

  has_many :ticket_hours, :foreign_key => 'ticketid'
  has_many :ticket_posts, :foreign_key => 'ticketid'
  belongs_to :ticket_user, :foreign_key => 'userid'
end
