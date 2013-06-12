class PrayerRequest < ActiveRecord::Base
  belongs_to :user  

  attr_accessible :user_id, :title, :request_text
end
