module FixtureReplacement
  
  attributes_for :contact do |a|
    a.name = "Orisha"
    a.project = default_project
  end

  attributes_for :ticket do |a|
    a.contact = default_contact
    a.subject = 'default_ticket'
  end

  attributes_for :hour_log do |a|
    a.agent = default_agent
    a.minutes = 30
    a.project = default_project
  end

  attributes_for :project do |a|
    a.name = 'test project'
  end

  attributes_for :ticket_data_import do |a|
    
  end

  attributes_for :help_ticket do |a|
  end

  attributes_for :help_hour do |a|
    a.help_staffer = default_help_staffer
    a.notes = 'default note'
    a.help_ticket = default_help_ticket
  end

  attributes_for :help_post do |a|
    a.help_staffer = default_help_staffer
    a.contents = 'default post'
    a.help_ticket = default_help_ticket
  end

  attributes_for :help_staffer do |a|
    
  end

  attributes_for :help_user do |a|
  end

  attributes_for :help_user_email do |a|
    a.help_user = default_help_user
  end

  attributes_for :agent do |a|
    a.email = 'staff@email.com'
  end

end
