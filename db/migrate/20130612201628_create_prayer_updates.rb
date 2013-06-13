class CreatePrayerUpdates < ActiveRecord::Migration
  def change
    create_table :prayer_updates do |t|
      t.integer :prayer_request_id
      t.text :body

      t.timestamps
    end
  end
end
