class TicketData < ActiveRecord::Base
  @abstract_class = true
  def self.make_connection
    if Rails.env == 'test'
      establish_connection configurations['tickets_test']
    else
      establish_connection configurations['tickets']
    end
  end
  make_connection
end
