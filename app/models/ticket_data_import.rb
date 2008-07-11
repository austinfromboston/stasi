class TicketDataImport < ActiveRecord::Base
  has_attachment :max_size => 150.megabytes, :storage => :file_system
end
