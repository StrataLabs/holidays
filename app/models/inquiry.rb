class Inquiry
  include Mongoid::Document

  embeds_many :responses
  validates_presence_of :responses

  class << self
    def build(question_id, preferences)
      question = Question.find(question_id)
      Inquiry.create!(:responses => [Response.build(question, preferences)])
    end
  end
end
