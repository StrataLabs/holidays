class QuestionGroup
  include Mongoid::Document

  field :name, :type => String
  embeds_many :questions

  validates_presence_of :name, :questions
end
