
module RadicalDesigns
  class MysqlDumpImporter

    def initialize( db_config_name  )
      @config_name = db_config_name
      configure
    end

    def process( path )
      configure
      import prepared_file( path )
    end

    def import( import_file )
      system(import_dump_command(import_file)) || raise( "Database import failed: file not found or mysql error"  )
    end

    def import_dump_command( import_file )
      "mysql -u #{@config['username']} --password=#{@config['password']} -D #{@config['database']} < #{import_file}"
    end

    def configure
      raise "adapter for #{@config_name} not found in database.yml" unless ActiveRecord::Base.configurations[@config_name]

      @config = ActiveRecord::Base.configurations[@config_name]
      raise "this task does not support the #{@config['adapter']} adapter used by #{@config_name}" unless @config['adapter'] == 'mysql'
      raise "no database defined for #{@config_name}" unless @config && @config['database']
      verify_db
    end

    def verify_db
      begin 
        ActiveRecord::Base.establish_connection @config
        ActiveRecord::Base.connection
      rescue
        ActiveRecord::Base.establish_connection @config.merge('database' => nil )
        ActiveRecord::Base.connection.create_database( @config['database'] )
        ActiveRecord::Base.establish_connection @config
      end
    end

    def drop_db
      ActiveRecord::Base.connection.drop_database @config['database']
    end

    def prepared_file( db_file )
      @tmp_path = '/tmp/stasi'
      %x[ rm -rf #{@tmp_path} ]
      %x[ mkdir #{@tmp_path} ]
      raise "Cannot find #{db_file}" unless File.exists? db_file

      %x[ cp #{db_file} #{@tmp_path} ]
      if File.extname(db_file) == '.gz'
        %x[ gunzip #{@tmp_path}/#{File.basename(db_file)} ]
      end

      txt_file = "#{@tmp_path}/#{File.basename(db_file, '.gz')}"
      final_filename = "#{@tmp_path}/prepared_#{File.basename(db_file, '.gz')}"

      #clears out some incompatible sql from the help db dump
      %x[ sed -e '/KEY.*contents/ d' -e 's/\(KEY.*kbarticleid.*)\),/\1/' #{txt_file} > #{final_filename} ]
      final_filename

    end
  end
end
