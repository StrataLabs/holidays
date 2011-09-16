class Inquiry
  include Mongoid::Document

  has_many :responses do
    def find_by_question_id(question_id)
      where(:question_id => question_id).first
    end
  end

  class << self
    def build(question_id, preferences)
      question = Question.where(:_id => question_id).first
      return false if question.nil?

      inquiry = Inquiry.create
      inquiry.responses << Response.create_or_update_for_inquiry_id(inquiry.id, question.id, preferences)
      inquiry
    end
  end

  def response_for_question(question)
    responses.find_by_question_id(question.id) || Response.new(:neutral => question.possible_responses, :question => question)
  end
end
