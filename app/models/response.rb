class Response
  include Mongoid::Document

  field :likes, :type => Array
  field :dislikes, :type => Array
  field :neutral, :type => Array
  embeds_one :question

  validates_presence_of :question

  class << self
    def build(question, preferences = {})
      Response.create!(preferences.merge({:question => question }))
    end
  end
end
