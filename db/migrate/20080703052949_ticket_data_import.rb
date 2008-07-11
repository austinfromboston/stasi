class TicketDataImport < ActiveRecord::Migration
  def self.up
    create_table "ticket_data_imports" do |t|
      t.string "filename", "content_type"
      t.integer "size"
      t.timestamps
    end
  end

  def self.down
    drop_table "ticket_data_imports"
  end
end
