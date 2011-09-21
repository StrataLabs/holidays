describe Detail do
  it "builds a details object inside an inquiry" do
    inquiry = Factory(:inquiry)
    response = Detail.build!(inquiry.id, :group_type => "Family")
    response.should be_true
    Inquiry.find(inquiry.id).detail.group_type.should == "Family"
  end

  it "does not fail when the inquiry object does not exist" do
    question = Factory(:question)
    Detail.build!(question.id, :group_type => "Family").should be_false
  end

  it "is valid when created from a factory" do
    Factory.build(:detail).should be_valid
  end
end
