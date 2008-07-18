class HelpStaffer < HelpData
  set_table_name 'swstaff'
  set_primary_key 'staffid'

  has_many :help_hours, :foreign_key => 'forstaffid'
  has_many :help_posts, :foreign_key => 'staffid'
  has_one :agent

  LOCAL_KEYS = { 
    :name               => 'fullname', 
    :login              => 'username',
    :email              => 'email',
    :phone              => 'mobilenumber',
    :help_staffer_id    => 'staffid'
    }


end
