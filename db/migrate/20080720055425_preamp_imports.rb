class PreampImports < ActiveRecord::Migration
  def self.up
    add_column :contacts, :contact_type, :string
    add_column :contacts, :billable, :boolean
    add_column :contacts, :primary, :boolean
    add_column :contacts, :technical, :boolean
    add_column :contacts, :deleted, :boolean
    add_column :contacts, :preamp_client_id, :integer

    add_column :projects, :status, :string
    add_column :projects, :preamp_status, :string
    add_column :projects, :preamp_client_id, :integer

    add_column :hour_logs, :preamp_hour_id, :integer
  end

  def self.down
    remove_column :hour_logs, :preamp_hour_id

    remove_column :projects, :preamp_client_id
    remove_column :projects, :preamp_status
    remove_column :projects, :status

    remove_column :contacts, :preamp_client_id
    remove_column :contacts, :contact_type
  end
end
