class PrayerUpdate < ActiveRecord::Base
  belongs_to :prayer_request

  attr_accessible :body, :prayer_request_id

  scope :recent, order("updated_at DESC") 
end
