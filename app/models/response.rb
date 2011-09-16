class Response
  include Mongoid::Document

  field :likes, :type => Array, :default => []
  field :dislikes, :type => Array, :default => []
  field :neutral, :type => Array, :default => []
  belongs_to :question
  belongs_to :inquiry

  validates_presence_of :question

  class << self
    def build(question, preferences = {})
      Response.create!(preferences.merge({:question => question }))
    end
  end
end
