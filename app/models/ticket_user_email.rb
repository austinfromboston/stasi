class TicketUserEmail < TicketData
  set_table_name 'swuseremails'
  set_primary_key 'useremailid'

  belongs_to :ticket_user, :foreign_key => 'userid'
end
