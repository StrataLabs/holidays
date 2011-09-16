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

    def create_or_update_for_inquiry_id(inquiry_id, question_id, preferences)
      response = find_or_create_by(:inquiry_id => inquiry_id, :question_id => question_id)
      [:likes, :dislikes, :neutral].each do |preference_type|
        response.write_attribute(preference_type, preferences[preference_type])
      end
      response
    end
  end
end
