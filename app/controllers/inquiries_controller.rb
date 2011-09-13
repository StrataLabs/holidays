class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.build(params[:question_id], :likes => params["likes"], :dislikes => params["dislikes"], :neutral => params["neutral"])
    redirect_to inquiry_path(@inquiry)
  end

  def show
    render :text => "foo"
  end
end
