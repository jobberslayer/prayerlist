class FrontPageController < ApplicationController
  before_filter :authenticate_user!
   
  def index
    @my_requests = PrayerRequest.belongs_to_user(current_user).descending.all
    @latest_requests = PrayerRequest.recent.all
    @latest_requests_ans = PrayerRequest.answered.recent.all
  end
end
