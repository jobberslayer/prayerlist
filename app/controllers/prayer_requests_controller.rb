class PrayerRequestsController < ApplicationController
  before_filter :authenticate_user!

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

    render :index

  end

  def show
    @prayer_request = PrayerRequest.find(params[:id])
    if @prayer_request.answered?
      @answered_text = 'Answered'
      @answered_button_style = 'success'
    else
      @answered_text = 'UnAnswered'
      @answered_button_style = 'warning'
    end
  end

  def edit
    @prayer_request = PrayerRequest.find(params[:id])
  end

  def update
    @prayer_request = PrayerRequest.find(params[:id])
    if @prayer_request.update_attributes(params[:prayer_request])
      flash.now[:success] = "Request updated."
      render :show
    else
      flash.now[:error] = "Errors below."
      render :edit
    end
  end

  def destroy
    @prayer_request = PrayerRequest.find(params[:id])
    @prayer_request.delete()
    flash[:success] = "Request deleted."
    redirect_to prayer_requests_path
  end

  def toggle_answered
    @prayer_request = PrayerRequest.find(params[:id])
    @prayer_request.toggle(:answered)
    if @prayer_request.save
      redirect_to prayer_request_path(params[:id])
    else
      flash.now[:error] = "Errors below"
      render :show
    end 
  end

  def new_update
    @prayer_request_id = params[:prayer_request_id]
    @prayer_update = PrayerUpdate.new()
  end

  def create_update
    prayer_request_id = params[:prayer_request_id]
    p = PrayerUpdate.new(params[:prayer_update])
    p.prayer_request_id = prayer_request_id 
    
    if p.save
      flash.now[:success] = "Prayer update created."
      redirect_to prayer_request_path(prayer_request_id)
    else
      flash.now[:error] = "Errors below."
      render :edit
    end

  end

  def edit_update
    @prayer_request = PrayerRequest.find(params[:prayer_request_id])
    @prayer_update = PrayerUpdate.find(params[:prayer_update_id])
  end

  def update_update
    @prayer_update = PrayerUpdate.find(params[:prayer_update_id])
    if @prayer_update.update_attributes(params[:prayer_update])
      flash[:success] = "Request updated."
      redirect_to prayer_request_path(params[:prayer_request_id]) 
    else
      flash.now[:error] = "Errors below."
      render :edit_update
    end
  end

  def destroy_update
    @prayer_update = PrayerUpdate.find(params[:prayer_update_id])
    @prayer_update.delete()
    flash[:success] = "Request deleted."
    redirect_to prayer_request_path(params[:prayer_request_id]) 
  end
end
