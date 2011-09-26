class InquiriesController < ApplicationController
  before_filter :redirect_if_not_logged_in, :only => :set_user
  before_filter :validate_ids_in_params

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
    @inquiry_detail = @inquiry.detail || Detail.new
  end

  def set_user
    inquiry = Inquiry.find(params[:inquiry_id])
    inquiry.user = current_user
    inquiry.save
    render :text => "Successfully logged in as #{inquiry.user.name} and saved in #{inquiry}"
  end
end
