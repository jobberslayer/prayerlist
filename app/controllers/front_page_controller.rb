class FrontPageController < ApplicationController
  def index
    @my_requests = PrayerRequest.belongs_to_user(current_user).descending.all
    @latest_requests = PrayerRequest.recent.all
    @latest_updates = PrayerUpdate.recent.all
  end
end
