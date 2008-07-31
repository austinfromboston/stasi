require File.dirname(__FILE__) + '/../../spec_helper'

describe 'ticket importer' do
  before do
    @db_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test.sql.gz" 
    @db_unzipped_path = "#{RAILS_ROOT}/spec/fixtures/tickets_test_unzipped.sql" 
    @tmp_path = "#{RAILS_ROOT}/tmp/stasi"
    @importer = RadicalDesigns::MysqlDumpImporter.new( 'tickets_test' )
  end
  it "creates a folder in tmp for use" do
    %x[ rm -rf #{@tmp_path} ]
    @importer.prepared_file(@db_path)
    File.exists?(@tmp_path).should be_true
  end

  it "ungzips the file to the tmp folder if the file is gzipped" do
    @importer.prepared_file(@db_path)
    File.exists?( "#{@tmp_path}/#{File.basename(@db_path, '.gz')}").should be_true
  end

  it "copies the file to /tmp directly if the file is not gzipped" do
    @importer.prepared_file(@db_unzipped_path)
    File.exists?( "#{@tmp_path}/#{File.basename(@db_unzipped_path)}").should be_true
  end
  it "returns the correct filename for all db dumps" do
    @importer.prepared_file(@db_unzipped_path).should == "#{@tmp_path}/prepared_tickets_test_unzipped.sql"
  end
  it "returns only the names of files which exist" do
    new_file = @importer.prepared_file(@db_unzipped_path)
    File.exists?(new_file).should be_true
  end
  it "always creates a file unless an error is raised" do
    File.exists?(@importer.prepared_file(@db_path)).should be_true
  end
  it "checks for the presence of an activerecord config" do
    lambda{ RadicalDesigns::MysqlDumpImporter.new('fake') }.should raise_error
  end

  it "accepts a config type on initialization" do
    importer = RadicalDesigns::MysqlDumpImporter.new('tickets') 
    importer.instance_variable_get(:@config_name).should == 'tickets'
  end
  it "only works for mysql" do
    begin
      ActiveRecord::Base.configurations['tickets_test']['adapter'] = 'sqlite'
      lambda { RadicalDesigns::MysqlDumpImporter.new('tickets_test') }.should raise_error
    ensure
      ActiveRecord::Base.configurations['tickets_test']['adapter'] = 'mysql'
    end
  end
  it "creates a system command for doing the actual import" do
    @importer.import_dump_command( 
      @importer.prepared_file(@db_path)
      ).should match( 
        /mysql -u \w+ --password=\w+ -D \w+ < #{@tmp_path}\/prepared_tickets_test.sql/ 
        )
  end
  it "has a one-stop method" do
    @importer.should_receive(:import)
    @importer.process( @db_path )
  end

  it "can clear an existing database" do
    ActiveRecord::Base.connection.should_receive(:drop_database)
    @importer.drop_db
    
  end

end

