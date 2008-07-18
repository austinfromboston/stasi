require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
namespace :db do
  namespace :tickets do
    desc "import a dump of the tickets database"
    task :import do
      raise ArgumentError.new("Please specify a database dump to import: rake db:tickets DB=/path/to/db_dump.sql") unless ENV['DB']

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
      RadicalDesigns::HelpImporter.new.convert
    end
  end
end
