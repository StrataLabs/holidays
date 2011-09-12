class InquiriesController < ApplicationController
  def create
    render :text => params.to_s
  end
end
