describe InquiriesHelper do
  context "detail_selector" do
    it "calls the select tag with the correct parameters" do
      helper.should_receive(:select).with("detail", :number_of_people, [1,2], :prompt => "Doesn't Matter", :selected => "2")
      helper.select_for_detail(Detail.new(:number_of_people => "2"), :number_of_people, [1,2])
    end
  end
end
