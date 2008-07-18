class Contact < ActiveRecord::Base
  establish_connection
  belongs_to :project
  belongs_to :help_user, :foreign_key  => 'userid'
  has_many :tickets
end
