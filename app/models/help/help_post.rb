class HelpPost < HelpData
  set_table_name 'swticketposts'
  set_primary_key 'ticketpostid'
  belongs_to :help_staffer, :foreign_key => 'staffid'
  belongs_to :help_ticket, :foreign_key => 'ticketid'
  belongs_to :help_user, :foreign_key => 'userid'

  def summary
    [ date_text,
    ( help_user.fullname if help_user ) ,
    ( help_staffer.fullname if help_staffer ),
    ( "-" * 20 ),
    contents].join("\n").gsub(/<\/?[^>]*>/,  "")
  end

  def date_text
    return "" unless dateline and dateline > 0
    Time.at(dateline).strftime("%d %B %Y")
  end
end
