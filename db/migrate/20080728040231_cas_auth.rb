class CasAuth < ActiveRecord::Migration
  def self.up
    add_column :agents, :cas_user, :string
  end

  def self.down
    remove_column :agents, :cas_user
  end
end
