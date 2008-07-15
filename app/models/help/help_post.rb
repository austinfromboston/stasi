class HelpPost < HelpData
  set_table_name 'swticketposts'
  set_primary_key 'ticketpostid'
  belongs_to :help_staffer, :foreign_key => 'staffid'
  belongs_to :help_ticket, :foreign_key => 'ticketid'
end
