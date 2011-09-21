class Detail
  include Mongoid::Document

  embedded_in :inquiry

  class << self
    def build!(inquiry_id, params)
      inquiry = Inquiry.where(:_id => inquiry_id).first
      return false if inquiry.nil?
      inquiry.create_detail(params)
    end
  end
end
