class Response
  include Mongoid::Document
  include Mongoid::History::Trackable
  track_history

  field :likes, :type => Array, :default => []
  field :dislikes, :type => Array, :default => []
  field :neutral, :type => Array, :default => []
  belongs_to :question
  belongs_to :inquiry

  validate do
    errors.add(:question, "is invalid") unless Question.exists?(:conditions => {:id => question_id})
    errors.add(:inquiry, "is invalid") unless Inquiry.exists?(:conditions => {:id => inquiry_id})
  end

  class << self
    def create_or_update_for_inquiry_id(inquiry_id, question_id, preferences)
      response = find_or_create_by(:inquiry_id => inquiry_id, :question_id => question_id)
      [:likes, :dislikes, :neutral].each do |preference_type|
        response.write_attribute(preference_type, preferences[preference_type])
      end
      response
    end
  end
end
