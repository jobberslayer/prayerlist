class FrontPageController < ApplicationController
  before_filter :authenticate_user!
   
  def index
    @latest_requests = PrayerRequest.recent.paginate(page: params[:lr_page], per_page: 5)
    @latest_requests_ans = PrayerRequest.answered.recent.paginate(page: params[:lra_page], per_page: 5)
    @my_requests = PrayerRequest.belongs_to_user(current_user).descending.paginate(page: params[:mr_page], per_page: 5)
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
