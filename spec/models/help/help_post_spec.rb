require File.dirname(__FILE__) + '/../../spec_helper'

describe HelpPost do
  before do
    @post = new_help_post
  end
  it "belongs to a HelpStaff" do
    @post.help_staffer.should be_an_instance_of(HelpStaffer)
  end

  it "belongs to a ticket" do
    @post.help_ticket.should be_an_instance_of(HelpTicket)
  end

  describe "summarized" do

    before do
      @post.contents = "unopened"
    end
    it "includes the body of the post" do
      @post.summary.should match(/unopened/)
    end

    it "includes the date of each post" do
      @post.dateline = Time.mktime  2007, 03, 01, 15, 01, 01
      @post.summary.should match(/March.+2007/)
    end

    it "includes the staff name" do
      @post.help_staffer = create_help_staffer :fullname => 'Bozo'
      @post.summary.should match(/Bozo/)
    end

    it "includes the user name" do
      @post.help_user = create_help_user :fullname => 'Krusty'
      @post.summary.should match(/Krusty/)
    end

  end

end

