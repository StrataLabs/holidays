class Inquiry
  include Mongoid::Document

  embeds_many :responses
  validates_presence_of :responses
end
