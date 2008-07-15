class Project < ActiveRecord::Base
  has_many :contacts
  has_many :hour_logs
end
