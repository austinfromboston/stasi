require 'casclient'
require 'casclient/frameworks/rails/filter'

auth_config = "#{RAILS_ROOT}/config/auth_server.yml" 
if File.exists? auth_config
  CASClient::Frameworks::Rails::Filter.configure YAML::load(IO.read( auth_config )).symbolize_keys
else
  raise "This application depends on a rubycas-server instance for authorization.  Please create a fil config/auth_server.yml"
end
#CASClient::Frameworks::Rails::Filter.configure :cas_base_url => "https://local-rubycas.org/cas"

