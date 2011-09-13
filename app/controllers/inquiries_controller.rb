class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.create
    redirect_to inquiry_path(@inquiry)
  end

  def show
    render :text => "foo"
  end
end
