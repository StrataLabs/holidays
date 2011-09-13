class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.build(params[:question_id], :likes => params["likes"], :dislikes => params["dislikes"], :neutral => params["neutral"])

    if @inquiry
      redirect_to inquiry_path(@inquiry)
    else
      head :status => 422
    end
  end

  def show
    render :text => "foo"
  end
end
