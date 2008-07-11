namespace :db do
  namespace :tickets do
    desc "import a dump of the tickets database"
    task :import do
      tmp_file = move_and_unpack_import_file_in_tmp(ENV['DB'])
      raise ArgumentError.new("Please specify a database dump to import: rake db:tickets DB=/path/to/db_dump.sql") unless tmp_file

      config_name = Rails.env == 'test' ? 'tickets_test' : 'tickets_production'
      config = evaluate_config(config_name)
      raise "no database defined for #{config_name}" unless config && config['database']

      recreate_database( config_name )
      import_to_mysql(config, tmp_file) || raise( "No database file found"  )
    end
    def import_to_mysql( config, import_file )
      system(import_to_mysql_command(config, import_file)) 
    end

    def import_to_mysql_command( config, import_file )
      "mysql -u #{config['username']} --password=#{config['password']} -D #{config['database']} < #{import_file}"
    end

    def evaluate_config(config_name)
      raise "adapter for #{config_name} not found in database.yml" unless ActiveRecord::Base.configurations[config_name]

      config = ActiveRecord::Base.configurations[config_name]
      raise "this task does not support the #{config['adapter']} adapter used by #{config_name}" unless config['adapter'] == 'mysql'
      config
    end

    def move_and_unpack_import_file_in_tmp( db_file )
      @tmp_path = '/tmp/stasi'
      %x[ rm -rf #{@tmp_path} ]
      %x[ mkdir #{@tmp_path} ]
      %x[ cp #{db_file} #{@tmp_path} ]
      if File.extname(db_file) == '.gz'
        %x[ gunzip #{@tmp_path}/#{File.basename(db_file)} ]
      end

      "#{@tmp_path}/#{File.basename(db_file, '.gz')}"
    end
    def recreate_database( config_name )
      require 'rake/testtask'
      require 'rake/rdoctask'
      require 'tasks/rails'
      real_env = RAILS_ENV
      Kernel.const_set(:RAILS_ENV, config_name)
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
    ensure
      Kernel.const_set(:RAILS_ENV, real_env )
    end

  end
end
