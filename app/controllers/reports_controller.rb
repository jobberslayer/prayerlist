class ReportsController < ApplicationController
  def answered
    @prayer_requests = PrayerRequest.answered.all
  end

  def unanswered
    @prayer_requests = PrayerRequest.unanswered.all
  end
end
