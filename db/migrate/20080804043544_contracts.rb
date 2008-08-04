class Contracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer  'project_id' 
      t.float    'monthly_support_hours'
      t.integer  'monthly_retainer', 'hourly_rate'
      t.string   'status'
      t.date     'activated_on', 'signed_on'
    end
  end

  def self.down
    drop_table :contracts
  end
end
