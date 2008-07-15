class Agent < ActiveRecord::Base
  establish_connection
  has_many :hour_logs
  has_and_belongs_to_many :tickets

  belongs_to :help_staffer
end
