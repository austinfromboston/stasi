basecamp_config = "#{RAILS_ROOT}/config/basecamp.yml"
basecamp_config = "#{RAILS_ROOT}/config/basecamp_example.yml" unless File.exists? "#{RAILS_ROOT}/config/basecamp.yml"
if File.exists? basecamp_config
  require 'basecamp'
  basecamp_settings = YAML::load(IO.read( basecamp_config )).symbolize_keys!

  session = Basecamp.new basecamp_settings[:domain], basecamp_settings[:login], basecamp_settings[:password], ( basecamp_settings[:ssl] || false )   
end

