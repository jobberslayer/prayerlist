class PrayerUpdate < ActiveRecord::Base
  # touch updates the prayer_request when a update is created or changed
  belongs_to :prayer_request, :touch => true

  attr_accessible :body, :prayer_request_id

  after_save :reindex_parent!

  def reindex_parent!
    prayer_request.index
  end

  scope :recent, order("updated_at DESC") 
end
