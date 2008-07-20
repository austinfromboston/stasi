class HelpSystem < ActiveRecord::Migration
  def self.up
    create_table "agents" do |t|
      t.string 'name', 'email', 'phone', 'login'
      t.integer 'help_staffer_id'
    end

    create_table "tickets" do |t|
      t.integer "contact_id", "help_ticket_id", "messages_count"
      t.string "subject", "status"
      t.text "messages", "summary"
      t.timestamps
    end

    create_table "agents_tickets", :id => false do |t|
      t.integer "agent_id", "ticket_id"
    end

    create_table "hour_logs" do |t|
      t.integer "agent_id", "ticket_id", "minutes", "help_hour_id"
      t.string "source", "billing_type", "project_id"
      t.text "notes"
      t.timestamps
    end

    create_table "contacts" do |t|
      t.string "name", "first_name", "last_name", "email", "phone"
      t.integer "project_id", "help_user_id"
      t.timestamps
    end

    create_table "projects" do |t|
      t.string "url", "organization", "name"
      t.timestamps
    end

  end


  def self.down

    drop_table "projects"

    drop_table "contacts"

    drop_table "hour_logs"

    drop_table "agents_tickets"

    drop_table "tickets"

    drop_table "agents"
  end
end
