class Contact < ActiveRecord::Base
  establish_connection
  belongs_to :project
  belongs_to :help_user, :foreign_key  => 'userid'
  has_many :tickets

  named_scope :unassigned, :conditions => [ 'project_id is ?', nil ]
  before_destroy ContactGrudgeRecorder

  def display_name
    name
  end

  def update_project_hour_logs
    return unless project_id
    tix = tickets.find :all, :include => :hour_logs
    tix.each do |ticket|
      ticket.hour_logs.each do |log|
        next if log.project_id
        log.update_attribute :project_id, project_id
      end
    end
  end

end
