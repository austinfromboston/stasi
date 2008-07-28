require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
namespace :db do
  namespace :preamp do
    desc "import a dump of the preamp database"
    task :import do
      raise ArgumentError.new("Please specify a database dump to import: rake db:preamp:import DB=/path/to/db_dump.sql") unless ENV['DB']

      config_name = Rails.env == 'test' ? 'preamp_test' : 'preamp'
      @importer = RadicalDesigns::MysqlDumpImporter.new( config_name )
      @importer.process( ENV['DB']) 

    end

    desc "drop the current preamp database and start with a clean db" 
    task :rebuild do
      config_name = Rails.env == 'test' ? 'preamp_test' : 'preamp'
      @importer = RadicalDesigns::MysqlDumpImporter.new( config_name )

      begin
        @importer.drop_db
      rescue
      end

      @importer.verify_db
    end
  
    desc "move new records into local db"
    task :convert do
      RadicalDesigns::DumpConverter.new.convert(:preamp)
      HelpUser.relate_imported_contacts_to_projects 
      Contact.all.each { |c| c.update_project_hour_logs }
      #HourLog.all( :conditions => [ 'project_id is ? and ticket_id is not ?',nil,nil ] ).each do |hl|
      #  hl.update_attribute( :project_id, hl.ticket.contact.project_id ) if hl.ticket and hl.ticket.contact
      #end
    end
  end
end

