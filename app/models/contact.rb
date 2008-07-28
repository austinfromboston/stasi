class Contact < ActiveRecord::Base
  establish_connection
  belongs_to :project
  belongs_to :help_user, :foreign_key  => 'userid'
  has_many :tickets

  named_scope :unassigned, :conditions => [ 'project_id is ?', nil ]
  before_destroy :new_grudge
  cattr_accessor :grudges

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

  def self.grudge_dump_file
    "#{RAILS_ROOT}/config/#{ self.name.to_s.underscore}_grudges_#{Rails.env}.yaml"
  end
  def self.grudges
    @grudges ||= YAML.load_file( grudge_dump_file ) 
    rescue
      @grudges = []
  end

  def self.grudge_match?( item )
    grudges.include?( item.to_grudge )
  end

  def to_grudge
    { :name => name, :preamp_client_id => preamp_client_id, :help_user_id => help_user_id, :email => email }
  end

  def new_grudge
    return true if self.class.grudges.include?( to_grudge )
    self.class.grudges << to_grudge
    File.open( self.class.grudge_dump_file, "w") { |f|  YAML.dump( self.class.grudges, f ) }
    true
  end
end
