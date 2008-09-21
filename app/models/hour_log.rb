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

  attr_accessor :charges, :overage

  def display_name
    "#{project.display_name if project} #{billing_type} : #{ agent.display_name}, #{"%0.2f" % (minutes.minutes.to_f / 1.hour)} hours"
  end

  BASECAMP_CONVERSIONS = {
    :source => "basecamp",
    :basecamp_id => :id,
    :notes => :extended_description,
    :created_at => lambda { |b| b[:date].to_time },
    :agent_id => lambda { |b| ( Agent.find_by_basecamp_id( b[:person_id] ) || {} )[:id] },
    :minutes => lambda { |b| ( b[:hours].to_f ) * 60 }
  }

  def self.describe_basecamp_entry(basecamp_entry)
    desc = []
    if basecamp_entry.todo_item_id
      list = basecamp_entry.todo_item.todo_list
      desc << list.name unless list.name.blank?
      desc << basecamp_entry.todo_item.content unless basecamp_entry.todo_item.content.blank?
    end
    desc << basecamp_entry.description unless basecamp_entry.description.blank?
    desc.join("\n")
  end

  def self.convert_from_basecamp(basecamp_entry)
    attrs = basecamp_entry.attributes.symbolize_keys
    attrs[:extended_description] = describe_basecamp_entry( basecamp_entry )
    Hash[*BASECAMP_CONVERSIONS.map do |attr, action|
      [ attr,
        case action
          when Symbol
            attrs[action]
          when Proc
            action.call attrs
          when String
            action
        end
      ]
    end.flatten]
  end
      

end
