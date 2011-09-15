class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.build(params[:question_id], params[:preferences])

    if @inquiry
      redirect_to inquiry_path(@inquiry)
    else
      head :status => 422
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @questions = QuestionGroup.where(:name => "details").first.questions
  end
end
