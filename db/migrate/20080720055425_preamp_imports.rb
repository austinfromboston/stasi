class PreampImports < ActiveRecord::Migration
  def self.up
    add_column :contacts, :contact_type, :string
    add_column :contacts, :preamp_client_id, :integer

    add_column :projects, :status, :string
    add_column :projects, :preamp_status, :string
    add_column :projects, :preamp_client_id, :integer

    add_column :hour_logs, :preamp_hour_id, :integer
  end

  def self.down
  end
end
