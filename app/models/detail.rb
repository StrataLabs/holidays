class Detail
  include Mongoid::Document

  embedded_in :inquiry
  field :number_of_people
  field :duration
  field :time_of_travel
  field :group_type

  NUMBER_OF_PEOPLE = ["2","3","4","5","6","7","8","9","10"]
  DURATION = [ '1 day', '< 1 week', '2 weeks' ]
  TIME_OF_TRAVEL = ['January', 'February', 'March', 'April']
  GROUP_TYPE = ["Family", "Couple", "Friends"]

  validates_inclusion_of :number_of_people, :in => NUMBER_OF_PEOPLE, :allow_blank => true
  validates_inclusion_of :duration, :in => DURATION, :allow_blank => true
  validates_inclusion_of :time_of_travel, :in => TIME_OF_TRAVEL, :allow_blank => true
  validates_inclusion_of :group_type, :in => GROUP_TYPE, :allow_blank => true
  validates_presence_of :inquiry

  class << self
    def build!(inquiry_id, params)
      inquiry = Inquiry.where(:_id => inquiry_id).first
      if inquiry.nil?
        Detail.new
      else
        inquiry.create_detail(params)
      end
    end
  end
end
