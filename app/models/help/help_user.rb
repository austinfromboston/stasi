class HelpUser < HelpData
  set_table_name 'swusers'
  set_primary_key 'userid'

  has_many :help_tickets, :foreign_key => 'userid'
end
