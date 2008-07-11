require File.dirname(__FILE__) + '/../../spec_helper'

describe "Ticket DB tasks" do
  describe_rake_task "db:tickets:import", "lib/tasks/tickets.rake" do
    before do
      @db_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test.sql.gz" 
      @db_unzipped_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test_unzipped.sql" 
      @tmp_path = "/tmp/stasi"
      ENV['DB'] = @db_path
    end
    it "grabs the filename from the command line" do
      self.should_receive(:move_and_unpack_import_file_in_tmp).with( @db_path )
      lambda { invoke! }.should raise_error(ArgumentError)
      #@db_file.should == @db_path
    end
    it "creates a folder in tmp for use" do
      %x[ rm -rf #{@tmp_path} ]
      invoke!
      File.exists?(@tmp_path).should be_true
    end
    it "ungzips the file to the tmp folder if the file is gzipped" do
      invoke!
      File.exists?( "/tmp/stasi/#{File.basename(@db_path, '.gz')}").should be_true
    end

    it "copies the file to /tmp directly if the file is not gzipped" do
      ENV['DB'] = @db_unzipped_path
      invoke!
      File.exists?( "/tmp/stasi/#{File.basename(@db_unzipped_path)}").should be_true
      ENV['DB'] = nil
    end
    it "returns the correct filename for all db dumps" do
      move_and_unpack_import_file_in_tmp(@db_unzipped_path).should == '/tmp/stasi/tickets_test_unzipped.sql'
      File.exists?(move_and_unpack_import_file_in_tmp(@db_unzipped_path)).should be_true
    end
    it "always creates a file unless an error is raised" do
      File.exists?(move_and_unpack_import_file_in_tmp(@db_path)).should be_true
    end
    it "checks for the test db in a test environment" do
      self.should_receive(:evaluate_config).with('tickets_test')
      lambda{ invoke! }.should raise_error
    end
    it "checks for the presence of an activerecord config" do
      self.stub!(:evaluate_config)
      lambda{ invoke! }.should raise_error
    end
    it "only works for mysql" do
      begin
        ActiveRecord::Base.configurations['tickets_test']['adapter'] = 'sqlite'
        lambda { invoke! }.should raise_error
      ensure
        ActiveRecord::Base.configurations['tickets_test']['adapter'] = 'mysql'
      end
    end
    it "creates a system command for doing the actual import" do
      import_to_mysql_command( 
        evaluate_config('tickets_test'), 
        move_and_unpack_import_file_in_tmp(@db_path)
        ).should match( 
          /mysql -u \w+ --password=\w+ -D \w+ < #{@tmp_path}\/tickets_test.sql/ 
          )
    end

    it "drops the database currently in the system" do
      @task = stub('any_task')
      @task.should_receive(:invoke).exactly(2).times
      Rake::Task.stub!(:[]).with('db:drop').and_return(@task)
      Rake::Task.stub!(:[]).with('db:create').and_return(@task)
      recreate_database('tickets_test')
    end

    it "loads a database into the system" do
      invoke!
      ActiveRecord::Base.establish_connection 'tickets_test'
      ActiveRecord::Base.connection.select_rows("select id, class from class").should_not be_empty
    end
  end
end
