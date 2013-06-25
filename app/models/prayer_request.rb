class PrayerRequest < ActiveRecord::Base
  belongs_to :user  
  has_many :prayer_updates, :dependent => :destroy

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :request_text, :presence => true

  attr_accessible :user_id, :title, :request_text

  scope :descending, order("updated_at DESC")
  scope :recent, order("updated_at DESC") 
  scope :answered, where(answered: true)
  scope :unanswered, where(answered: false)

  searchable do 
    text :title, :request_text
    text :user do
      user.name
    end
    text :prayer_updates do
      prayer_updates.map { |pu| pu.body }
    end
    time :updated_at
  end

  def self.belongs_to_user(user)
    where(user_id: user.id)
  end

end
