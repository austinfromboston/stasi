require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpUserEmail do
  before do
    @email = create_help_user_email
  end
  it "belongs to a user" do
    @email.help_user.should be_an_instance_of(HelpUser)
  end
end

