class Project < ActiveRecord::Base
  establish_connection
  has_many :contacts
  has_many :hour_logs
end
