class HelpUserEmail < HelpData
  set_table_name 'swuseremails'
  set_primary_key 'useremailid'

  belongs_to :help_user, :foreign_key => 'userid'
end
