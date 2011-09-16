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
    questions = QuestionGroup.where(:name => "details").first.questions
    @responses = questions.collect { |question| @inquiry.response_for_question(question) }
  end

  def preferences
    render :text => params[:question_id]
  end
end
