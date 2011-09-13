class Response
  include Mongoid::Document

  field :likes, :type => Array
  field :dislikes, :type => Array
  field :neutral, :type => Array
  embeds_one :question

  validates_presence_of :likes, :dislikes, :neutral, :question
end
