if File.exist? "#{RAILS_ROOT}/config/api_access_key.yml"
  ::API_ACCESS_KEY = YAML.load_file("config/api_access_key.yml")[:key]
end
