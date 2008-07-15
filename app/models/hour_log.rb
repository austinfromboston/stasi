class HourLog < ActiveRecord::Base
  belongs_to :agent
  belongs_to :project
  belongs_to :ticket
  belongs_to :help_hour, :foreign_key => 'timetrackid'
end
