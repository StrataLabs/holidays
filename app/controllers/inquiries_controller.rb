class InquiriesController < ApplicationController
  def create
    Inquiry.create
    redirect_to "http://google.com"
  end
end
