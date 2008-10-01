class Linein::Person < ActiveResource::Base
  self.site =     Linein::CONFIG[:aquarius][:url]
  self.password = Linein::CONFIG[:aquarius][:key]
  self.user =     Linein::CONFIG[:aquarius][:default_user]
end
