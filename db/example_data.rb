module FixtureReplacement
  attributes_for :ticket_data_import do |a|
    
  end

  attributes_for :ticket do |a|
  end

  attributes_for :ticket_hour do |a|
    a.ticket_staffer = default_ticket_staffer
    a.notes = 'default note'
    a.ticket = default_ticket
  end

  attributes_for :ticket_post do |a|
    a.ticket_staffer = default_ticket_staffer
    a.contents = 'default post'
    a.ticket = default_ticket
  end

  attributes_for :ticket_staffer do |a|
    
  end

  attributes_for :ticket_user do |a|
  end

  attributes_for :ticket_user_email do |a|
    a.ticket_user = default_ticket_user
  end

  attributes_for :wrangler do |a|
    a.email = 'staff@email.com'
  end

end
