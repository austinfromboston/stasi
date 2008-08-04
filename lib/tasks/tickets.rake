require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
namespace :db do
  namespace :tickets do
    desc "import a dump of the tickets database"
    task :import do
      raise ArgumentError.new("Please specify a database dump to import: rake db:tickets:import DB=/path/to/db_dump.sql") unless ENV['DB']

      config_name = Rails.env == 'test' ? 'tickets_test' : 'tickets'
      @importer = RadicalDesigns::MysqlDumpImporter.new( config_name )
      @importer.process( ENV['DB']) 

    end

    desc "drop the current tickets database and start with a clean db" 
    task :rebuild do
      config_name = Rails.env == 'test' ? 'tickets_test' : 'tickets'
      @importer = RadicalDesigns::MysqlDumpImporter.new( config_name )

      begin
        @importer.drop_db
      rescue
      end

      @importer.verify_db
    end
  
    desc "move new records into local db"
    task :convert do
      HelpUser.all.each { |hu| hu.destroy unless hu.valid? }
      RadicalDesigns::DumpConverter.new.convert(:help)
      ContactGrudgeRecorder.grudges.each do |grudge| 
        possibles = Contact.find_all_by_help_user_id( grudge[:help_user_id] )
        possibles.each { |ps| ps.destroy if ContactGrudgeRecorder.match?(ps) }
      end
    end
  end
end
