class PrayerRequest < ActiveRecord::Base
  belongs_to :user  
  has_many :prayer_updates

  attr_accessible :user_id, :title, :request_text
end
