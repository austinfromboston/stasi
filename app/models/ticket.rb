class Ticket < ActiveRecord::Base
  establish_connection
  belongs_to :contact
  belongs_to :help_ticket
end
