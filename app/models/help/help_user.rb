class HelpUser < HelpData
  set_table_name 'swusers'
  set_primary_key 'userid'

  has_many :help_tickets,     :foreign_key => 'userid'
  has_many :help_user_emails, :foreign_key => 'userid'

  has_one :contact

  LOCAL_KEYS = {
    :name => 'fullname',
    :email => 'most_recent_email',
    :phone => 'phone'
  }

  def most_recent_email 
    email_record = help_user_emails.find( :first, :order => 'useremailid DESC' )
    email_record.email if email_record
  end
end
