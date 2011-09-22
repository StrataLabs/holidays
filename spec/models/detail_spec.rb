describe Detail do
  it "builds a details object inside an inquiry" do
    inquiry = Factory(:inquiry)
    response = Detail.build!(inquiry.id, :group_type => "Family")
    response.should be_valid
    Inquiry.find(inquiry.id).detail.group_type.should == "Family"
  end

  it "does not fail when the inquiry object does not exist" do
    question = Factory(:question)
    Detail.build!(question.id, :group_type => "Family").should_not be_valid
  end

  context "validation" do
    let(:inquiry) { Factory(:inquiry) }
    let(:detail) { inquiry.build_detail }

    [:number_of_people, :duration, :time_of_travel, :group_type].each do |property|
      it "is invalid if the value for #{property} is not in the reference data" do
        detail[property] = "invalid_value"
        detail.should have(1).error_on(property)
      end
    end
  end
end
