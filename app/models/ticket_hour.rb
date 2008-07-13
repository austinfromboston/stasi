class TicketHour < TicketData
  set_table_name 'swtickettimetrack'
  set_primary_key 'timetrackid'
  belongs_to :ticket_staffer, :foreign_key => 'forstaffid'
  belongs_to :ticket, :foreign_key => 'ticketid'
end
