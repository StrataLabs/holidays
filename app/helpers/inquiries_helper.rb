module InquiriesHelper
  def select_for_detail(detail, property, options)
    select("detail", property, options, :prompt => "Doesn't Matter", :selected => detail[property])
  end
end
