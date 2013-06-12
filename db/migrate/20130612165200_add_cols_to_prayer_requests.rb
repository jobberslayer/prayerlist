class AddColsToPrayerRequests < ActiveRecord::Migration
  def change
    add_column :prayer_requests, :user_id, :integer
    add_column :prayer_requests, :title, :string
    add_column :prayer_requests, :request_text, :text
    add_column :prayer_requests, :answered, :string
    add_column :prayer_requests, :boolean, :string, :default => 'false'
  end
end
