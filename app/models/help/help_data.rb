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
    local_keys.inject({}) do |memo, ( local_key, my_key ) |
      memo.merge local_key => self.send( my_key )
    end
  end
end
