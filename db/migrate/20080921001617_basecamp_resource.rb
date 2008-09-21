class BasecampResource < ActiveRecord::Migration
  def self.up
    add_column    'agents',    'basecamp_id', :integer
    add_column    'projects',  'basecamp_id', :integer
    add_column    'hour_logs',  'basecamp_id', :integer
  end

  def self.down
    remove_column 'agents',    'basecamp_id'
    remove_column 'projects',  'basecamp_id'
    remove_column 'hour_log',  'basecamp_id'
  end
end
