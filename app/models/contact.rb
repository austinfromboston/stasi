class Contact < ActiveRecord::Base
  belongs_to :project
  belongs_to :help_user, :foreign_key  => 'userid'
  has_many :tickets
end
