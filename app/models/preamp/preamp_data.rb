class PreampData < ActiveRecord::Base
  @abstract_class = true
  establish_connection configurations[ ( Rails.env == 'test' ? 'preamp_test' : 'preamp' ) ]
  LOCAL_KEYS = {}
  def local_attributes
    local_keys = self.class.const_get(:LOCAL_KEYS)
    local_keys.inject({}) do |memo, ( local_key, my_key ) |
      memo.merge local_key => self.send( my_key )
    end
  end
end
