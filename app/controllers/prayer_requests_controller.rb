class PrayerRequestsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
  end

  def new
    @prayer_request = PrayerRequest.new()
  end

  def create
    prayer_request = params[:prayer_request]
    p = PrayerRequest.new(prayer_request)
    p.user_id = current_user.id
    
    if p.save
      flash.now[:success] = "Prayer request created."
    else
      flash.now[:error] = "Errors below."
    end

    render index

  end

  def show
    @prayer_request = PrayerRequest.find(params[:id])
  end

  def edit
    @prayer_request = PrayerRequest.find(params[:id])
  end
end
