class TicketUser < TicketData
  set_table_name 'swusers'
  set_primary_key 'userid'

  has_many :tickets, :foreign_key => 'userid'
end
