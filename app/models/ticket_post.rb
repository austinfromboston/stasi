class TicketPost < TicketData
  set_table_name 'swticketposts'
  set_primary_key 'ticketpostid'
  belongs_to :ticket_staffer, :foreign_key => 'staffid'
  belongs_to :ticket, :foreign_key => 'ticketid'
end
