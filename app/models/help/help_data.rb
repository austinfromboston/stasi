class HelpData < ActiveRecord::Base
  @abstract_class = true
  def self.make_connection
    if Rails.env == 'test'
      establish_connection configurations['tickets_test']
    else
      establish_connection configurations['tickets']
    end
  end
  make_connection
  LOCAL_KEYS = {}

  def local_attributes
    local_keys = self.class.const_get(:LOCAL_KEYS)
    Hash[ *local_keys.map{ |local_key, my_key| [ local_key, self.send( my_key ) ] }.compact.flatten ]
  end
end
