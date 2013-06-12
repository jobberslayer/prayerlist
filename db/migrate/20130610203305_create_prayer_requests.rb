class CreatePrayerRequests < ActiveRecord::Migration
  def change
    create_table :prayer_requests do |t|

      t.timestamps
    end
  end
end
