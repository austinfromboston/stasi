class HourLog < ActiveRecord::Base
  belongs_to :agent
  belongs_to :project
  belongs_to :ticket
  belongs_to :help_hour, :foreign_key => 'timetrackid'
  establish_connection
  cattr_reader :per_page
  @@per_page = 50

  BILLING_TYPES = %w[ support setup training bugfix discovery development ]

  named_scope :from_year,   RadicalDesigns::Trackable.year_condition( self )
  named_scope :from_month,  RadicalDesigns::Trackable.month_condition( self )

  def display_name
    "#{project.display_name if project} #{billing_type} : #{ agent.display_name}, #{"%0.2f" % (minutes.minutes.to_f / 1.hour)} hours"
  end
end
