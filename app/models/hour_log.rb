class HourLog < ActiveRecord::Base
  belongs_to :agent
  belongs_to :project
  belongs_to :ticket
  belongs_to :help_hour, :foreign_key => 'timetrackid'
  establish_connection
  cattr_reader :per_page
  @@per_page = 50

  BILLING_TYPES = %w[ support setup bugfix ]

  named_scope :from_year, RadicalDesigns::Trackable.year_condition( self )
  named_scope :from_month, RadicalDesigns::Trackable.month_condition( self )
end
