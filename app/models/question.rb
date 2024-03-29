class Question
  include Mongoid::Document

  field :name, :type => String
  field :text, :type => String
  field :possible_responses, :type => Array
  field :allow_custom_responses

  validates_presence_of :name, :text, :possible_responses
end
