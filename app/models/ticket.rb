class Ticket < ActiveRecord::Base
  establish_connection
  belongs_to :contact
  belongs_to :help_ticket
  has_many :hour_logs
  cattr_reader :per_page
  @@per_page = 100

  has_and_belongs_to_many :agents

  named_scope :from_year,  RadicalDesigns::Trackable.year_condition
  named_scope :from_month, RadicalDesigns::Trackable.month_condition

end
