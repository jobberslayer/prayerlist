require 'spec_helper'

describe ReportsController do

  describe "GET 'answered'" do
    it "returns http success" do
      get 'answered'
      response.should be_success
    end
  end

  describe "GET 'unanswered'" do
    it "returns http success" do
      get 'unanswered'
      response.should be_success
    end
  end

end
