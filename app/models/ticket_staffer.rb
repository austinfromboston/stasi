class TicketStaffer < TicketData
  set_table_name 'swstaff'
  set_primary_key 'staffid'

  has_many :ticket_hours, :foreign_key => 'forstaffid'
end
