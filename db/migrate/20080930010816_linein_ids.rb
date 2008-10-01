class LineinIds < ActiveRecord::Migration
  def self.up
    add_column :contacts, "linein_person_id", :integer
    add_column :projects, "linein_project_id", :integer
    add_column :contracts, "linein_contract_id", :integer
    add_column :projects, "linein_organization_id", :integer
  end

  def self.down
    remove_column :projects, "linein_organization_id"
    remove_column :contracts, "linein_contract_id"
    remove_column :projects, "linein_project_id"
    remove_column :contacts, "linein_person_id"
  end
end
