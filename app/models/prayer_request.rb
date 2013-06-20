class PrayerRequest < ActiveRecord::Base
  belongs_to :user  
  has_many :prayer_updates

  attr_accessible :user_id, :title, :request_text
  scope :descending, order("updated_at DESC")
  scope :recent, order("updated_at DESC") 
  scope :answered, where(answered: true)
  scope :unanswered, where(answered: false)

  def self.belongs_to_user(user)
    where(user_id: user.id)
  end

end
