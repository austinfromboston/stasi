require File.dirname(__FILE__) + '/../../spec_helper'

describe "Ticket DB tasks" do
  describe_rake_task "db:tickets:import", "tasks/tickets.rake" do
    before do
      @db_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test.sql.gz" 
      @db_unzipped_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test_unzipped.sql" 
      @tmp_path = "/tmp/stasi"
      ENV['DB'] = @db_path
      @importer = RadicalDesigns::MysqlDumpImporter.new( 'tickets_test' )
      RadicalDesigns::MysqlDumpImporter.stub!(:new).and_return(@importer)
    end
    it "grabs the filename from the command line" do
      path = @importer.prepared_file(@db_path)
      @importer.should_receive(:prepared_file).with( @db_path ).at_least(1).times.and_return path
      invoke! 
    end
    it "checks for the test db in a test environment" do
      RadicalDesigns::MysqlDumpImporter.should_receive(:new).with('tickets_test').at_least(1).times.and_return(@importer)
      invoke!
    end
  end

  describe_rake_task "db:tickets:rebuild", "tasks/tickets.rake" do
    it "drops the database currently in the system" do
      @importer = RadicalDesigns::MysqlDumpImporter.new( 'tickets_test' )
      @importer.should_receive(:drop_db).at_least(1).times
      RadicalDesigns::MysqlDumpImporter.stub!(:new).and_return(@importer)
      invoke!
    end

    it "creates a clean, new database" do
      ActiveRecord::Base.establish_connection('tickets_test')
      invoke!
      ActiveRecord::Base.connection.current_database.should == ActiveRecord::Base.configurations[ 'tickets_test' ]['database']
    end
  end
end
