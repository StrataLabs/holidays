class Inquiry
  include Mongoid::Document

  embeds_many :responses do
    def find_by_question_id(question_id)
      where(:question_id => question_id).first
    end
  end
  validates_presence_of :responses

  class << self
    def build(question_id, preferences)
      question = Question.where(:_id => question_id).first
      return false if question.nil?
      Inquiry.create!(:responses => [Response.build(question, preferences)])
    end
  end

  def response_for_question(question)
    responses.find_by_question_id(question.id) || Response.new(:neutral => question.possible_responses, :question => question)
  end
end
