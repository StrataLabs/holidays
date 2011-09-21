class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.build(params[:question_id], params[:preferences])

    if @inquiry
      redirect_to inquiry_path(@inquiry)
    else
      head :status => :unprocessable_entity
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    questions = QuestionGroup.where(:name => "details").first.questions
    @responses = questions.collect { |question| @inquiry.response_for_question(question) }
  end
end
